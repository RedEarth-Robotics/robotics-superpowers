# Symlink Installer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create an idempotent shell script that symlinks robotics-specific skills from this repo into `~/.config/devin/skills/` using a ROBOTICS marker file for detection.

**Architecture:** A single `install.sh` script at repo root detects skills with `ROBOTICS` marker files, then creates/removes symlinks in the global Devin skills directory with conflict detection and dry-run support.

**Tech Stack:** POSIX shell (bash-compatible), `ln`, `readlink`, standard Unix utilities.

---

## File Structure

| File | Responsibility |
|------|---------------|
| `install.sh` | Main installer script. Handles install, uninstall, dry-run, help modes. Detects conflicts, reports status. |
| `skills/<name>/ROBOTICS` | Marker file (empty). Presence indicates this skill is robotics-specific and should be symlinked. |

---

### Task 1: Create ROBOTICS marker files in all robotics skills

**Files:**
- Create: `skills/ros-robotics-expert/ROBOTICS`
- Create: `skills/robotics-localization-expert/ROBOTICS`
- Create: `skills/robotics-odometry-expert/ROBOTICS`
- Create: `skills/robotics-data-analyzer/ROBOTICS`
- Create: `skills/robotics-devops-engineer/ROBOTICS`
- Create: `skills/fusion-filter-robotics-expert/ROBOTICS`
- Create: `skills/gps-ins-localization-expert/ROBOTICS`
- Create: `skills/cpp-misra-auditor/ROBOTICS`
- Create: `skills/security-pentester/ROBOTICS`
- Create: `skills/token-optimizer/ROBOTICS`

- [ ] **Step 1: Create all ROBOTICS marker files**

```bash
cd /home/frederichtran199/Code/robotics/robotics-superpowers
touch skills/ros-robotics-expert/ROBOTICS
touch skills/robotics-localization-expert/ROBOTICS
touch skills/robotics-odometry-expert/ROBOTICS
touch skills/robotics-data-analyzer/ROBOTICS
touch skills/robotics-devops-engineer/ROBOTICS
touch skills/fusion-filter-robotics-expert/ROBOTICS
touch skills/gps-ins-localization-expert/ROBOTICS
touch skills/cpp-misra-auditor/ROBOTICS
touch skills/security-pentester/ROBOTICS
touch skills/token-optimizer/ROBOTICS
```

- [ ] **Step 2: Verify marker files exist**

```bash
find skills -name "ROBOTICS" | wc -l
```
Expected: `10`

- [ ] **Step 3: Commit**

```bash
git add skills/*/ROBOTICS
git commit -m "Add ROBOTICS marker files to identify installable skills"
```

---

### Task 2: Write the install.sh script header and argument parsing

**Files:**
- Create: `install.sh`

- [ ] **Step 1: Create install.sh with argument parsing**

```bash
cat > install.sh << 'SCRIPT'
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
SCRIPT
chmod +x install.sh
```

- [ ] **Step 2: Verify script is executable**

```bash
ls -l install.sh
```
Expected: `-rwxr-xr-x` (or similar with x bits)

- [ ] **Step 3: Test help flag**

```bash
./install.sh --help
```
Expected: Shows usage message with all options, exits 0.

---

### Task 3: Implement skill discovery (find skills with ROBOTICS marker)

**Files:**
- Modify: `install.sh` (append to existing content)

- [ ] **Step 1: Append skill discovery logic**

```bash
cat >> install.sh << 'SCRIPT'

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
SCRIPT
```

- [ ] **Step 2: Test discovery**

```bash
./install.sh --dry-run 2>/dev/null || true
```
Expected: Lists all 10 robotics skills by name.

- [ ] **Step 3: Commit**

```bash
git add install.sh
git commit -m "Add skill discovery via ROBOTICS marker files"
```

---

### Task 4: Implement install mode with conflict detection

**Files:**
- Modify: `install.sh` (append to existing content)

- [ ] **Step 1: Append install logic with conflict detection**

```bash
cat >> install.sh << 'SCRIPT'

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
            ((ALREADY_LINKED++))
            return 0
        else
            echo "  [SKIP] ${skill} (symlink points elsewhere: ${current_target})"
            ((SKIPPED++))
            return 0
        fi
    elif [[ -e "${target}" ]]; then
        # File or directory exists (not a symlink)
        echo "  [SKIP] ${skill} (conflict: $(file -b "${target}" | cut -d',' -f1))"
        ((SKIPPED++))
        return 0
    fi

    # Safe to create symlink
    if [[ "${DRY_RUN}" == "true" ]]; then
        echo "  [DRY]  ${skill} (would create symlink)"
        ((CREATED++))
        return 0
    fi

    ln -s "${source}" "${target}"
    echo "  [NEW]  ${skill} (created)"
    ((CREATED++))
    return 0
}

# Main install loop
if [[ "${UNINSTALL}" != "true" ]]; then
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
SCRIPT
```

- [ ] **Step 2: Test dry-run install**

```bash
./install.sh --dry-run
```
Expected: Shows `[DRY]` for all 10 skills, reports "10 linked, 0 already linked, 0 skipped."

- [ ] **Step 3: Test actual install**

```bash
./install.sh
```
Expected: Shows `[NEW]` for all 10 skills, reports "10 linked, 0 already linked, 0 skipped."

- [ ] **Step 4: Verify symlinks created**

```bash
ls -la ~/.config/devin/skills/ | grep -E "ros-robotics|robotics-localization|robotics-odometry|robotics-data|robotics-devops|fusion-filter|gps-ins|cpp-misra|security-pentester|token-optimizer"
```
Expected: 10 symlinks all pointing to paths under `robotics-superpowers/skills/`

- [ ] **Step 5: Test idempotency (re-run)**

```bash
./install.sh
```
Expected: Shows `[OK]` for all 10 skills, reports "0 linked, 10 already linked, 0 skipped."

- [ ] **Step 6: Commit**

```bash
git add install.sh
git commit -m "Implement install mode with conflict detection and dry-run"
```

---

### Task 5: Implement uninstall mode

**Files:**
- Modify: `install.sh` (modify the main logic section)

- [ ] **Step 1: Replace the main install loop section to add uninstall logic**

Read the current install.sh to find the exact section to replace. The section starts with `# Main install loop` and goes to the end.

Replace this section:

```bash
# Main install loop
if [[ "${UNINSTALL}" != "true" ]]; then
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
```

With this expanded version:

```bash
# Main install loop
if [[ "${UNINSTALL}" == "true" ]]; then
    REMOVED=0
    SKIPPED_UNINSTALL=0

    echo "Uninstalling robotics skills..."
    echo ""

    for skill in "${ROBOTICS_SKILLS[@]}"; do
        local target="${TARGET_DIR}/${skill}"

        if [[ -L "${target}" ]]; then
            local current_target
            current_target="$(readlink "${target}" 2>/dev/null || true)"
            if [[ "${current_target}" == "${SOURCE_DIR}/${skill}" ]]; then
                if [[ "${DRY_RUN}" == "true" ]]; then
                    echo "  [DRY]  ${skill} (would remove symlink)"
                else
                    rm "${target}"
                    echo "  [REM]  ${skill} (removed)"
                fi
                ((REMOVED++))
            else
                echo "  [SKIP] ${skill} (points elsewhere, not removing)"
                ((SKIPPED_UNINSTALL++))
            fi
        elif [[ -e "${target}" ]]; then
            echo "  [SKIP] ${skill} (not a symlink, not removing)"
            ((SKIPPED_UNINSTALL++))
        else
            echo "  [SKIP] ${skill} (does not exist)"
            ((SKIPPED_UNINSTALL++))
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
```

- [ ] **Step 2: Test uninstall dry-run**

```bash
./install.sh --uninstall --dry-run
```
Expected: Shows `[DRY]` for all 10 skills, reports "10 removed, 0 skipped."

- [ ] **Step 3: Test actual uninstall**

```bash
./install.sh --uninstall
```
Expected: Shows `[REM]` for all 10 skills, reports "10 removed, 0 skipped."

- [ ] **Step 4: Verify symlinks removed**

```bash
ls -la ~/.config/devin/skills/ | grep -E "ros-robotics|robotics-localization|robotics-odometry|robotics-data|robotics-devops|fusion-filter|gps-ins|cpp-misra|security-pentester|token-optimizer"
```
Expected: Empty output (no symlinks present).

- [ ] **Step 5: Re-install for final verification**

```bash
./install.sh
```
Expected: Shows `[NEW]` for all 10 skills.

- [ ] **Step 6: Commit**

```bash
git add install.sh
git commit -m "Implement uninstall mode with safety checks"
```

---

### Task 6: Test edge cases and conflicts

**Files:**
- Modify: `install.sh` (only if bugs found)

- [ ] **Step 1: Test conflict with existing directory**

```bash
mkdir -p ~/.config/devin/skills/ros-robotics-expert
echo "fake" > ~/.config/devin/skills/ros-robotics-expert/fake.txt
./install.sh
```
Expected: Shows `[SKIP] ros-robotics-expert (conflict: ...)`, continues with other skills.

- [ ] **Step 2: Clean up conflict**

```bash
rm -rf ~/.config/devin/skills/ros-robotics-expert
```

- [ ] **Step 3: Test conflict with symlink to different target**

```bash
ln -s /tmp ~/.config/devin/skills/ros-robotics-expert
./install.sh
```
Expected: Shows `[SKIP] ros-robotics-expert (symlink points elsewhere: /tmp)`.

- [ ] **Step 4: Clean up and re-install**

```bash
rm ~/.config/devin/skills/ros-robotics-expert
./install.sh
```
Expected: `[NEW] ros-robotics-expert (created)`.

- [ ] **Step 5: Commit any fixes**

If install.sh was modified:
```bash
git add install.sh
git commit -m "Fix edge case handling in conflict detection"
```
If no changes needed, skip this commit.

---

### Task 7: Update README with installer instructions

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Update README installation section**

Replace the current README content (lines 5-15) with:

```markdown
## Installation

### Quick Install

Run the installer script to symlink all robotics skills into your global Devin skills directory:

```bash
git clone https://github.com/RedEarth-Robotics/robotics-superpowers.git
cd robotics-superpowers
./install.sh
```

### Manual Install

If you prefer manual setup, symlink individual skills from `skills/` into `~/.config/devin/skills/`.

### Uninstall

```bash
./install.sh --uninstall
```

### Options

- `--dry-run` — Show what would happen without making changes
- `--uninstall` — Remove all symlinks created by this installer
- `--help` — Show usage information
```

- [ ] **Step 2: Verify README renders correctly**

```bash
cat README.md
```

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "Update README with installer instructions"
```

---

### Task 8: Final verification

- [ ] **Step 1: Full install test**

```bash
./install.sh --uninstall
./install.sh
./install.sh  # idempotency check
```
Expected: First run removes all, second creates all, third shows all already linked.

- [ ] **Step 2: Verify all skills are discoverable**

```bash
ls -la ~/.config/devin/skills/ | grep -c "robotics-superpowers"
```
Expected: `10`

- [ ] **Step 3: Run final checks**

```bash
./install.sh --help
./install.sh --dry-run
./install.sh --uninstall --dry-run
```
All should execute without errors.

- [ ] **Step 4: Clean state — leave installed for use**

```bash
./install.sh
```

- [ ] **Step 5: Final commit (if any)**

Only if changes were made during verification.
