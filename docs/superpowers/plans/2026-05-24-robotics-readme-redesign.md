# Robotics README Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite README.md to position this as a robotics-focused fork of Superpowers, highlighting robotics skills and yato integration while preserving installation instructions.

**Architecture:** Single-file rewrite of README.md with robotics-focused content, clear fork positioning, and preserved installation section.

**Tech Stack:** Markdown documentation

---

### Task 1: Read Current README and Design Spec

**Files:**
- Read: `README.md` (current version)
- Read: `docs/superpowers/specs/2026-05-24-robotics-readme-redesign-design.md`

- [ ] **Step 1: Read current README.md**

Read the full current README.md to understand existing structure and content.

- [ ] **Step 2: Read design spec**

Read the design spec to confirm the target structure.

- [ ] **Step 3: Extract installation section**

Extract the exact text of the installation section (lines 31-153) to preserve it.

---

### Task 2: Write New Robotics-Focused README

**Files:**
- Modify: `README.md` (complete rewrite)

- [ ] **Step 1: Write title and introduction**

```markdown
# Superpowers for Robotics

Superpowers for Robotics is a specialized fork of [Superpowers](https://github.com/obra/superpowers), enhanced with domain-specific skills for robotics development and integrated with [Yato](https://github.com/RedEarth-Robotics/yato) token optimization.

This fork extends the original Superpowers methodology with 7 new robotics skills, enabling your AI coding agent to tackle ROS development, sensor fusion, localization, odometry, and robotics DevOps with expert-level guidance.

## Quickstart

Give your agent Superpowers for Robotics: [Claude Code](#claude-code), [Codex CLI](#codex-cli), [Codex App](#codex-app), [Factory Droid](#factory-droid), [Gemini CLI](#gemini-cli), [OpenCode](#opencode), [Cursor](#cursor), [GitHub Copilot CLI](#github-copilot-cli).
```

- [ ] **Step 2: Preserve installation section**

Copy the exact installation text from the original README (lines 31-153 from original), preserving all harness installation instructions unchanged.

- [ ] **Step 3: Write robotics skills section**

```markdown
## Robotics Skills

This fork includes 7 specialized robotics skills that integrate seamlessly with the Superpowers workflow:

### ROS & Systems
- **`ros-robotics-expert`** — ROS (Robot Operating System) for robotics arms and mobile robotics
  - *Trigger:* "help me with ROS", "debug my ROS issue", "should I use ROS1 or ROS2?"
  - Covers: nodes, topics, services, sensor integration, real-time constraints, Gazebo simulation

### Localization & Navigation
- **`robotics-localization-expert`** — Visual odometry, SLAM, GPS-based localization, sensor fusion
  - *Trigger:* "my robot keeps drifting", "SLAM implementation issues", "how do I improve localization accuracy?"
  - Covers: ORB-SLAM, LiDAR SLAM, particle filters, Kalman filters, loop closure

- **`gps-ins-localization-expert`** — GPS and INS (Inertial Navigation System) integration
  - *Trigger:* "GPS signal is lost", "should I use GPS or INS?", "analyze this GPS/INS error"
  - Covers: DGPS, RTK, sensor fusion algorithms, GPS denial scenarios

### Odometry & Motion
- **`robotics-odometry-expert`** — Visual, ground-based, and underwater odometry systems
  - *Trigger:* "visual odometry is drifting", "analyze this odometry log", "how do I improve odometry accuracy?"
  - Covers: wheel encoders, IMU fusion, DVL, feature tracking, slip estimation

### Data & Analysis
- **`robotics-data-analyzer`** — Sensor data, perception systems, localization analysis
  - *Trigger:* "analyze this sensor data", "debug my perception issues", "process these ROS logs"
  - Covers: multi-sensor analysis, ROS bag files, temporal alignment, statistical rigor

- **`fusion-filter-robotics-expert`** — Kalman filters, sensor fusion, localization challenges
  - *Trigger:* "help me implement a Kalman filter", "my EKF is diverging", "how do I fuse GPS and IMU data?"
  - Covers: EKF, UKF, particle filters, multi-hypothesis tracking, observability analysis

### DevOps & Deployment
- **`robotics-devops-engineer`** — Deploy and containerize robotics code for production
  - *Trigger:* "help me deploy this robotics code", "containerize our robotics application", "set up a CI/CD pipeline for our robot"
  - Covers: Docker, Kubernetes, Ansible, CI/CD, hardware-in-the-loop testing
```

- [ ] **Step 4: Write yato integration section**

```markdown
## Yato Token Optimization

This fork integrates [Yato](https://github.com/RedEarth-Robotics/yato) — a token optimization framework designed for large-scale robotics projects.

### Benefits for Robotics Development

- **Reduced Token Usage** — Yato's compression and filtering reduces context window consumption when working with large robotics codebases
- **AST-Aware Extraction** — Extract relevant code context from ROS packages, sensor drivers, and control systems without losing structural information
- **Smart Context Filtering** — Prioritize relevant sensor data, configuration files, and algorithm implementations during debugging sessions
- **Robotics Workflow Optimization** — Automatically manage context when analyzing multi-sensor data streams or complex ROS node graphs

### How It Works

Yato integrates with the Superpowers skills system, automatically optimizing token usage when robotics skills are invoked. When you ask your agent to debug localization drift or review ROS code, Yato ensures the most relevant context is preserved while keeping token usage efficient.
```

- [ ] **Step 5: Write adapted workflow section**

```markdown
## The Robotics Workflow

The core Superpowers workflow remains unchanged, but robotics skills auto-trigger at the right moments:

1. **brainstorming** — Before writing ROS nodes or sensor fusion algorithms, the agent explores requirements and design alternatives

2. **using-git-worktrees** — Creates isolated workspace for robotics features (e.g., "add LiDAR support")

3. **writing-plans** — Breaks robotics tasks into bite-sized steps with exact file paths and verification

4. **subagent-driven-development** — Dispatches fresh agents per robotics task (implement sensor driver → review → integrate)

5. **test-driven-development** — Enforces RED-GREEN-REFACTOR for robotics code (critical for safety)

6. **robotics skills auto-trigger** — When you mention "ROS", "localization", "odometry", or "sensor fusion", relevant skills activate automatically

**Example:** Say "My robot is drifting in SLAM" → `robotics-localization-expert` activates → systematic diagnosis → fix plan → implementation with TDD.

**The agent checks for relevant skills before any task.** Mandatory workflows, not suggestions.
```

- [ ] **Step 6: Write original repository section**

```markdown
## Original Repository

This project is a fork of [Superpowers](https://github.com/obra/superpowers) by [Jesse Vincent](https://blog.fsck.com) and the team at [Prime Radiant](https://primeradiant.com).

- **Upstream:** https://github.com/obra/superpowers
- **Purpose:** This fork adds robotics-specific skills and Yato integration to the core Superpowers methodology
- **Contributing:** Core Superpowers improvements should be submitted upstream. Robotics-specific enhancements are maintained in this fork.

**Community:**
- **Discord:** [Join the Superpowers community](https://discord.gg/35wsABTejz)
- **Issues:** https://github.com/obra/superpowers/issues
- **Release announcements:** [Sign up](https://primeradiant.com/superpowers/)
```

- [ ] **Step 7: Preserve license section**

```markdown
## License

MIT License - see LICENSE file for details
```

---

### Task 3: Verify README Structure and Links

**Files:**
- Test: `README.md`

- [ ] **Step 1: Verify markdown structure**

Run: `python3 -c "import markdown; markdown.markdown(open('README.md').read())"`
Expected: No errors, valid markdown

- [ ] **Step 2: Check all links**

Verify these links work:
- https://github.com/obra/superpowers (original repo)
- https://github.com/RedEarth-Robotics/yato (yato repo)
- All installation anchor links (#claude-code, #codex-cli, etc.)

- [ ] **Step 3: Verify sections present**

Checklist:
- [ ] Title: "Superpowers for Robotics"
- [ ] Introduction mentions fork status
- [ ] Installation section preserved
- [ ] Robotics skills section with 7 skills
- [ ] Yato integration section
- [ ] Workflow section adapted for robotics
- [ ] Original repository section at bottom
- [ ] License section present

- [ ] **Step 4: Commit**

```bash
git add README.md
git commit -m "Rewrite README for robotics-focused fork positioning"
```

---

### Task 4: Final Review

**Files:**
- Review: `README.md`

- [ ] **Step 1: Read final README**

Read the complete README.md to verify it reads well and all sections are coherent.

- [ ] **Step 2: Compare with design spec**

Verify all requirements from the design spec are met:
- Clear fork positioning
- Installation instructions preserved
- All 7 robotics skills described
- Yato integration explained
- Original repository acknowledged

- [ ] **Step 3: Commit implementation plan**

```bash
git add docs/superpowers/plans/2026-05-24-robotics-readme-redesign.md
git commit -m "Add implementation plan for robotics README redesign"
```
