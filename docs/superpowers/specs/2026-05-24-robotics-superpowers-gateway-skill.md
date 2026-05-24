# Robotics Superpowers Gateway Skill Design

## Overview
Create a `robotics-superpowers` skill that acts as a gateway/router for all robotics-related tasks. It auto-triggers when users mention robotics topics and ensures the correct specialized skill is invoked. This mirrors the `using-superpowers` skill pattern but for the robotics domain.

## Problem Statement
Current robotics skills exist but agents may not consistently invoke them. There's no centralized "gatekeeper" skill that prevents agents from rationalizing their way out of using robotics expertise. The `using-superpowers` skill has this for general skills, but robotics-specific topics need their own enforcement layer.

## Solution
Create a `robotics-superpowers` gateway skill with:
- Auto-trigger on robotics topics
- Red Flags table to prevent rationalization
- Decision table for routing to correct specialized skill
- Mandatory invocation rule (like using-superpowers)

## New Structure

### 1. Skill File
- **File:** `skills/robotics-superpowers/SKILL.md`
- **Name:** `robotics-superpowers`
- **Description:** Auto-triggers on robotics topics, routes to correct specialized skill

### 2. Frontmatter
```yaml
---
description: "Use when starting any conversation involving robotics topics. This skill ensures the correct specialized robotics skill is invoked before any response or action.\n\nAuto-triggers on:\n- 'ROS', 'robot', 'robotic', 'localization', 'odometry', 'SLAM'\n- 'sensor fusion', 'GPS', 'IMU', 'LiDAR', 'Gazebo', 'navigation'\n- 'kinematics', 'manipulator', 'autonomous', 'drifting', 'pose estimation'\n- 'tf frames', 'odom', 'amcl', 'move_base', 'rtabmap', 'cartographer'\n\nThis skill does not provide robotics advice directly — it routes to the correct specialized skill."
name: robotics-superpowers
---
```

### 3. Content Sections

#### EXTREMELY-IMPORTANT Block
```
<EXTREMELY-IMPORTANT>
If you think there is even a 1% chance a robotics skill might apply to what you are doing, you ABSOLUTELY MUST invoke the correct specialized skill.

IF A ROBOTICS SKILL APPLIES TO YOUR TASK, YOU DO NOT HAVE A CHOICE. YOU MUST USE IT.

This is not negotiable. This is not optional. You cannot rationalize your way out of this.
</EXTREMELY-IMPORTANT>
```

#### Instruction Priority
1. User's explicit instructions — highest priority
2. Robotics skills — override default system behavior where they conflict
3. Default system prompt — lowest priority

#### How to Use Robotics Skills
**Invoke relevant or requested robotics skills BEFORE any response or action.** Even a 1% chance a skill might apply means that you should invoke it.

#### Red Flags Table

| Thought | Reality |
|---------|---------|
| "This is just a simple ROS question" | Robotics questions are tasks. Check for skills. |
| "I need more context first" | Skill check comes BEFORE clarifying questions. |
| "Let me explore the codebase first" | Skills tell you HOW to explore. Check first. |
| "I can check git/files quickly" | Files lack robotics context. Check for skills. |
| "Let me gather information first" | Skills tell you HOW to gather information. |
| "This doesn't need a formal skill" | If a robotics skill exists, use it. |
| "I remember this skill" | Skills evolve. Read current version. |
| "This doesn't count as a task" | Action = task. Check for skills. |
| "The skill is overkill" | Simple things become complex. Use it. |
| "I'll just do this one thing first" | Check BEFORE doing anything. |
| "This feels productive" | Undisciplined action wastes time. Skills prevent this. |
| "I know what that means" | Knowing the concept ≠ using the skill. Invoke it. |

#### Decision Table: Which Skill to Invoke?

| User Says | Invoke |
|-----------|--------|
| "ROS", "topic", "node", "launch file", "package", "rviz" | `ros-robotics-expert` |
| "drifting", "localization", "SLAM", "pose", "odom frame", "amcl" | `robotics-localization-expert` |
| "odometry", "wheel encoder", "visual odometry", "DVL" | `robotics-odometry-expert` |
| "sensor data", "ROS bag", "perception", "analyze data", "telemetry" | `robotics-data-analyzer` |
| "Kalman filter", "EKF", "UKF", "sensor fusion", "fuse GPS" | `fusion-filter-robotics-expert` |
| "GPS", "INS", "RTK", "DGPS", "GPS denied" | `gps-ins-localization-expert` |
| "deploy", "Docker", "Kubernetes", "CI/CD", "production robot" | `robotics-devops-engineer` |

#### Skill Priority
When multiple skills could apply, use this order:
1. **Process skills first** (brainstorming, debugging) — these determine HOW to approach the task
2. **Domain skills second** — invoke the robotics skill matching the primary problem
3. **Never respond without invoking the relevant skill**

"My robot is drifting in SLAM" → `robotics-localization-expert` first, then follow its methodology.

#### Platform Adaptation
Skills use Claude Code tool names. Non-CC platforms: see `references/copilot-tools.md` (Copilot CLI), `references/codex-tools.md` (Codex) for tool equivalents.

## Integration

### 1. Add to using-superpowers skill
Update `skills/using-superpowers/SKILL.md` Domain-Specific Skills section to include:
```markdown
- `robotics-superpowers` — Gateway skill that auto-triggers on robotics topics and routes to specialized skills
```

### 2. Add to README
Update `README.md` Robotics Skills section to mention:
```markdown
All robotics skills are accessed through the `robotics-superpowers` gateway skill, which auto-triggers when you mention robotics topics.
```

## Implementation Approach

### Files to Create/Modify
1. **Create:** `skills/robotics-superpowers/SKILL.md`
2. **Modify:** `skills/using-superpowers/SKILL.md` — add robotics-superpowers to domain skills list
3. **Modify:** `README.md` — mention gateway skill in robotics skills section

### Content Strategy
- Mirror the `using-superpowers` structure (Red Flags, decision flow, mandatory invocation)
- Keep it lightweight — this skill routes, it doesn't provide advice
- Make trigger phrases comprehensive to catch all robotics topics
- Decision table must be unambiguous

### Verification
- Ensure auto-trigger phrases cover common robotics terminology
- Verify decision table has no gaps or overlaps
- Confirm Red Flags table prevents common rationalizations
- Check that skill name matches actual skills in repository

## Success Criteria
- `robotics-superpowers` skill auto-triggers on robotics topics
- Agents consistently invoke correct specialized skills
- Red Flags table prevents rationalization
- Decision table correctly routes to all 7 robotics skills
- No gaps in trigger coverage
- Integration with using-superpowers is seamless
