#!/usr/bin/env bash
set -euo pipefail

# robotics-superpowers skill installer
# Symlinks robotics-specific skills into ~/.config/devin/skills/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/skills"
TARGET_DIR="${HOME}/.config/devin/skills"

# Parse arguments
DRY_RUN=false
UNINSTALL=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --uninstall)
            UNINSTALL=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help|-h)
            echo "Usage: ./install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --install     Install symlinks (default)"
            echo "  --uninstall   Remove symlinks created by this script"
            echo "  --dry-run     Show what would happen without making changes"
            echo "  --help, -h    Show this help message"
            echo ""
            echo "Installs robotics-specific skills from this repo into ~/.config/devin/skills/"
            exit 0
            ;;
        --install)
            shift
            ;;
        *)
            echo "Unknown option: $1" >&2
            echo "Run './install.sh --help' for usage." >&2
            exit 1
            ;;
    esac
done

echo "robotics-superpowers skill installer"
echo "====================================="
echo ""
echo "Target: ${TARGET_DIR}"
echo "Source: ${SOURCE_DIR}"
echo ""

# Discover skills with ROBOTICS marker
mapfile -t ROBOTICS_SKILLS < <(find "${SOURCE_DIR}" -maxdepth 2 -name "ROBOTICS" -print0 | \
    xargs -0 -n1 dirname | \
    xargs -n1 basename | \
    sort)

if [[ ${#ROBOTICS_SKILLS[@]} -eq 0 ]]; then
    echo "ERROR: No skills with ROBOTICS marker found in ${SOURCE_DIR}" >&2
    exit 1
fi

echo "Skills to process (${#ROBOTICS_SKILLS[@]}):"
for skill in "${ROBOTICS_SKILLS[@]}"; do
    echo "  - ${skill}"
done
echo ""

# Counters
CREATED=0
ALREADY_LINKED=0
SKIPPED=0

install_skill() {
    local skill="$1"
    local source="${SOURCE_DIR}/${skill}"
    local target="${TARGET_DIR}/${skill}"

    if [[ -L "${target}" ]]; then
        # It's a symlink — check where it points
        local current_target
        current_target="$(readlink "${target}" 2>/dev/null || true)"
        if [[ "${current_target}" == "${source}" ]]; then
            echo "  [OK]   ${skill} (already linked)"
            ((ALREADY_LINKED++)) || true
            return 0
        else
            echo "  [SKIP] ${skill} (symlink points elsewhere: ${current_target})"
            ((SKIPPED++)) || true
            return 0
        fi
    elif [[ -e "${target}" ]]; then
        # File or directory exists (not a symlink)
        echo "  [SKIP] ${skill} (conflict: $(file -b "${target}" | cut -d',' -f1))"
        ((SKIPPED++)) || true
        return 0
    fi

    # Safe to create symlink
    if [[ "${DRY_RUN}" == "true" ]]; then
        echo "  [DRY]  ${skill} (would create symlink)"
        ((CREATED++)) || true
        return 0
    fi

    ln -s "${source}" "${target}"
    echo "  [NEW]  ${skill} (created)"
    ((CREATED++)) || true
    return 0
}

# Main install loop
if [[ "${UNINSTALL}" == "true" ]]; then
    REMOVED=0
    SKIPPED_UNINSTALL=0

    echo "Uninstalling robotics skills..."
    echo ""

    for skill in "${ROBOTICS_SKILLS[@]}"; do
        target="${TARGET_DIR}/${skill}"

        if [[ -L "${target}" ]]; then
            current_target="$(readlink "${target}" 2>/dev/null || true)"
            if [[ "${current_target}" == "${SOURCE_DIR}/${skill}" ]]; then
                if [[ "${DRY_RUN}" == "true" ]]; then
                    echo "  [DRY]  ${skill} (would remove symlink)"
                else
                    rm "${target}"
                    echo "  [REM]  ${skill} (removed)"
                fi
                ((REMOVED++)) || true
            else
                echo "  [SKIP] ${skill} (points elsewhere, not removing)"
                ((SKIPPED_UNINSTALL++)) || true
            fi
        elif [[ -e "${target}" ]]; then
            echo "  [SKIP] ${skill} (not a symlink, not removing)"
            ((SKIPPED_UNINSTALL++)) || true
        else
            echo "  [SKIP] ${skill} (does not exist)"
            ((SKIPPED_UNINSTALL++)) || true
        fi
    done

    echo ""
    echo "Done. ${REMOVED} removed, ${SKIPPED_UNINSTALL} skipped."
else
    # Install mode
    # Ensure target directory exists
    if [[ "${DRY_RUN}" != "true" ]]; then
        mkdir -p "${TARGET_DIR}"
    fi

    for skill in "${ROBOTICS_SKILLS[@]}"; do
        install_skill "${skill}"
    done

    echo ""
    echo "Done. ${CREATED} linked, ${ALREADY_LINKED} already linked, ${SKIPPED} skipped."
fi
