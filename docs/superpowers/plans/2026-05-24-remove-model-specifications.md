# Remove Model Specifications from All Skills Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove hardcoded `model` field from YAML frontmatter in 11 skill files to allow harnesses to choose appropriate models.

**Architecture:** Simple metadata removal - edit each skill's SKILL.md file to remove the `model: <model-name>` line while preserving all other frontmatter fields.

**Tech Stack:** YAML frontmatter editing, file modification

---

### Task 1: Remove model from ros-robotics-expert

**Files:**
- Modify: `skills/ros-robotics-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/ros-robotics-expert/SKILL.md
git commit -m "Remove model specification from ros-robotics-expert skill"
```

### Task 2: Remove model from robotics-localization-expert

**Files:**
- Modify: `skills/robotics-localization-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/robotics-localization-expert/SKILL.md
git commit -m "Remove model specification from robotics-localization-expert skill"
```

### Task 3: Remove model from robotics-odometry-expert

**Files:**
- Modify: `skills/robotics-odometry-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/robotics-odometry-expert/SKILL.md
git commit -m "Remove model specification from robotics-odometry-expert skill"
```

### Task 4: Remove model from robotics-data-analyzer

**Files:**
- Modify: `skills/robotics-data-analyzer/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/robotics-data-analyzer/SKILL.md
git commit -m "Remove model specification from robotics-data-analyzer skill"
```

### Task 5: Remove model from fusion-filter-robotics-expert

**Files:**
- Modify: `skills/fusion-filter-robotics-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/fusion-filter-robotics-expert/SKILL.md
git commit -m "Remove model specification from fusion-filter-robotics-expert skill"
```

### Task 6: Remove model from gps-ins-localization-expert

**Files:**
- Modify: `skills/gps-ins-localization-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/gps-ins-localization-expert/SKILL.md
git commit -m "Remove model specification from gps-ins-localization-expert skill"
```

### Task 7: Remove model from python-expert

**Files:**
- Modify: `skills/python-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: swe`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/python-expert/SKILL.md
git commit -m "Remove model specification from python-expert skill"
```

### Task 8: Remove model from cpp-pro

**Files:**
- Modify: `skills/cpp-pro/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name`, `description`, and `tools` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/cpp-pro/SKILL.md
git commit -m "Remove model specification from cpp-pro skill"
```

### Task 9: Remove model from matlab-pro

**Files:**
- Modify: `skills/matlab-pro/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-sonnet-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/matlab-pro/SKILL.md
git commit -m "Remove model specification from matlab-pro skill"
```

### Task 10: Remove model from linux-ubuntu-expert

**Files:**
- Modify: `skills/linux-ubuntu-expert/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-sonnet-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/linux-ubuntu-expert/SKILL.md
git commit -m "Remove model specification from linux-ubuntu-expert skill"
```

### Task 11: Remove model from data-pipeline-architect

**Files:**
- Modify: `skills/data-pipeline-architect/SKILL.md:4`

- [ ] **Step 1: Remove model line from frontmatter**

Remove line 4: `model: claude-opus-4.6`

- [ ] **Step 2: Verify frontmatter is valid**

Check that YAML frontmatter still has valid structure with `name` and `description` fields.

- [ ] **Step 3: Commit**

```bash
git add skills/data-pipeline-architect/SKILL.md
git commit -m "Remove model specification from data-pipeline-architect skill"
```

### Task 12: Verification

**Files:**
- All modified skill files

- [ ] **Step 1: Verify all model fields removed**

Check that none of the 11 modified files contain a `model:` line in their frontmatter.

- [ ] **Step 2: Verify skill content unchanged**

Confirm that skill content (after frontmatter) is identical to original - only frontmatter changed.

- [ ] **Step 3: Verify YAML validity**

Ensure all modified files have valid YAML frontmatter that can be parsed.

- [ ] **Step 4: Final commit**

```bash
git add docs/superpowers/plans/2026-05-24-remove-model-specifications.md
git commit -m "Add implementation plan for removing model specifications"
```
