# Symlink Installer Design — robotics-superpowers

## Overview

Create an idempotent shell script (`install.sh`) that symlinks all robotics-specific skills from this repository into the global Devin skills directory (`~/.config/devin/skills/`). This enables the robotics skills to be auto-discovered and invoked by Devin CLI without manual setup.

## Design Goals

- **Idempotent**: Running the script multiple times produces the same result
- **Safe**: Detects conflicts (existing files, broken symlinks, directories) and fails gracefully
- **Reversible**: Includes uninstall mode to cleanly remove all symlinks
- **Informative**: Tells the user what it did, what it skipped, and why
- **Zero dependencies**: Pure shell, no external tools required beyond standard POSIX utilities

## Global Paths

| Path | Purpose |
|------|---------|
| `~/.config/devin/skills/` | Global Devin skills directory (target) |
| `/home/frederichtran199/Code/robotics/robotics-superpowers/skills/` | Source skills directory (absolute path for repo root) |

## Skill Detection

The script identifies which skills in the repo are "robotics-specific" by checking for a marker file: `ROBOTICS`. Skills that have this file in their directory are symlinked. This avoids symlinking shared/common skills that already exist in the main Superpowers repo.

### Robotics Skills (ROBOTICS marker)

- `ros-robotics-expert`
- `robotics-localization-expert`
- `robotics-odometry-expert`
- `robotics-data-analyzer`
- `robotics-field-engineer`
- `fusion-filter-robotics-expert`
- `gps-ins-localization-expert`
- `cpp-misra-auditor`
- `security-pentester`
- `token-optimizer`

### Skills WITHOUT ROBOTICS marker (shared with main Superpowers, DO NOT symlink)

- `brainstorming`
- `dispatching-parallel-agents`
- `executing-plans`
- `finishing-a-development-branch`
- `receiving-code-review`
- `requesting-code-review`
- `subagent-driven-development`
- `systematic-debugging`
- `test-driven-development`
- `using-git-worktrees`
- `using-superpowers`
- `verification-before-completion`
- `writing-plans`
- `writing-skills`

## Script Interface

```bash
# Install (default): create symlinks for all robotics skills
./install.sh

# Uninstall: remove all symlinks created by this script
./install.sh --uninstall

# Dry-run: show what would happen without making changes
./install.sh --dry-run

# Help
./install.sh --help
```

## Conflict Detection Logic

For each skill to symlink:

1. **Already a correct symlink** (points to repo skill dir): skip, report OK
2. **Already a symlink to somewhere else**: warn, skip (user has override)
3. **A regular file or directory exists**: warn, skip (conflict)
4. **Nothing exists**: create symlink, report created

## Uninstall Logic

For each robotics skill:

1. Is it a symlink pointing to our repo? → remove
2. Is it a symlink pointing elsewhere? → skip (don't touch user overrides)
3. Is it a regular file or directory? → skip (don't delete user files)
4. Doesn't exist? → skip (nothing to do)

## Output Format

```
robotics-superpowers skill installer
=====================================

Target: ~/.config/devin/skills/
Source: /home/frederichtran199/Code/robotics/robotics-superpowers/skills/

Skills to install (10):
  [OK]   ros-robotics-expert          (already linked)
  [NEW]  robotics-localization-expert (created)
  [SKIP] robotics-field-engineer     (conflict: directory exists)
  ...

Done. 8 linked, 1 skipped, 1 already linked.
```

## Error Handling

- Missing source directory → fatal error with clear message
- Missing target parent directory → create it (with `mkdir -p`)
- Permission denied → report which skill failed, continue with others
- No skills with ROBOTICS marker found → warn and exit

## File Layout

```
robotics-superpowers/
├── install.sh                  # Main installer script
├── skills/
│   ├── ros-robotics-expert/
│   │   ├── SKILL.md
│   │   └── ROBOTICS            # Marker file
│   ├── ...
│   └── brainstorming/          # No ROBOTICS marker
│       └── SKILL.md
└── docs/superpowers/specs/
    └── 2026-05-25-symlink-installer-design.md  # This file
```

## Verification

After running `install.sh`, verify with:

```bash
ls -la ~/.config/devin/skills/
# Should show symlinks to robotics skills in this repo
```

## Testing Checklist

- [ ] Clean install on fresh system
- [ ] Re-run install (idempotent)
- [ ] Uninstall after install
- [ ] Install when conflicts exist (directory with same name)
- [ ] Install when symlink to different target exists
- [ ] Dry-run mode
- [ ] Missing target parent directory
