# Remove Model Specifications from All Skills

## Overview
Remove the `model` field from the YAML frontmatter of all skills that currently specify models. This allows the harness to choose appropriate models rather than hardcoding specific model requirements.

## Problem Statement
Several skills in the superpowers repository have hardcoded model specifications in their frontmatter (e.g., `model: claude-opus-4.6`). These specifications:
- Limit flexibility in model selection
- May become outdated as models evolve
- Prevent harnesses from making optimal model choices based on context
- Create maintenance burden when updating model preferences

## Solution
Remove the `model` field from all skill frontmatter files while preserving all other metadata.

## Scope

### Skills to Modify
1. `ros-robotics-expert` - Remove `model: claude-opus-4.6`
2. `robotics-localization-expert` - Remove `model: claude-opus-4.6`
3. `robotics-odometry-expert` - Remove `model: claude-opus-4.6`
4. `robotics-data-analyzer` - Remove `model: claude-opus-4.6`
5. `fusion-filter-robotics-expert` - Remove `model: claude-opus-4.6`
6. `gps-ins-localization-expert` - Remove `model: claude-opus-4.6`
7. `python-expert` - Remove `model: swe`
8. `cpp-pro` - Remove `model: claude-opus-4.6`
9. `matlab-pro` - Remove `model: claude-sonnet-4.6`
10. `linux-ubuntu-expert` - Remove `model: claude-sonnet-4.6`
11. `data-pipeline-architect` - Remove `model: claude-opus-4.6`

### Files to Change
- `/skills/ros-robotics-expert/SKILL.md`
- `/skills/robotics-localization-expert/SKILL.md`
- `/skills/robotics-odometry-expert/SKILL.md`
- `/skills/robotics-data-analyzer/SKILL.md`
- `/skills/fusion-filter-robotics-expert/SKILL.md`
- `/skills/gps-ins-localization-expert/SKILL.md`
- `/skills/python-expert/SKILL.md`
- `/skills/cpp-pro/SKILL.md`
- `/skills/matlab-pro/SKILL.md`
- `/skills/linux-ubuntu-expert/SKILL.md`
- `/skills/data-pipeline-architect/SKILL.md`

## Implementation Approach

### Change Method
For each skill file:
1. Read the current SKILL.md file
2. Remove the `model: <model-name>` line from the YAML frontmatter
3. Preserve all other frontmatter fields (name, description, tools if present)
4. Write the modified content back to the file

### Example Change
**Before:**
```yaml
---
name: ros-robotics-expert
description: "Use this agent when..."
model: claude-opus-4.6
---
```

**After:**
```yaml
---
name: ros-robotics-expert
description: "Use this agent when..."
---
```

## Testing
- Verify each modified file still has valid YAML frontmatter
- Ensure skill content is unchanged
- Confirm skills can still be loaded and invoked
- No functional changes to skill behavior

## Impact
- **Positive**: Increased flexibility in model selection, reduced maintenance burden
- **Neutral**: No functional changes to skill behavior
- **Risk**: Minimal - only metadata removal, no logic changes

## Alternatives Considered
1. **Keep model specifications**: Rejected due to inflexibility and maintenance burden
2. **Standardize all frontmatter**: Rejected as out of scope for this change
3. **Add model selection logic**: Rejected as unnecessary complexity

## Success Criteria
- All 11 skills have model field removed from frontmatter
- All other frontmatter fields preserved
- Skills remain functional and loadable
- No unintended changes to skill content
