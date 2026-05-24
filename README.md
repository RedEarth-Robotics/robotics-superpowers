# Superpowers for Robotics

Superpowers for Robotics is a specialized fork of [Superpowers](https://github.com/obra/superpowers), enhanced with domain-specific skills for robotics development and integrated with [Yato](https://github.com/RedEarth-Robotics/yato) token optimization.

This fork extends the original Superpowers methodology with 7 new robotics skills, enabling your AI coding agent to tackle ROS development, sensor fusion, localization, odometry, and robotics DevOps with expert-level guidance.

## Quickstart

Give your agent Superpowers for Robotics: [Claude Code](#claude-code), [Codex CLI](#codex-cli), [Codex App](#codex-app), [Factory Droid](#factory-droid), [Gemini CLI](#gemini-cli), [OpenCode](#opencode), [Cursor](#cursor), [GitHub Copilot CLI](#github-copilot-cli).

## Installation

**First, install the original Superpowers** using the instructions for your harness below. Then, clone this fork to access the robotics skills and Yato integration.

```bash
git clone https://github.com/RedEarth-Robotics/robotics-superpowers.git
```

The robotics skills are located in the `skills/` directory and can be loaded alongside your main Superpowers installation.

Installation differs by harness. If you use more than one, install Superpowers separately for each one.

### Claude Code

Superpowers is available via the [official Claude plugin marketplace](https://claude.com/plugins/superpowers)

#### Official Marketplace

- Install the plugin from Anthropic's official marketplace:

  ```bash
  /plugin install superpowers@claude-plugins-official
  ```

#### Superpowers Marketplace

The Superpowers marketplace provides Superpowers and some other related plugins for Claude Code.

- Register the marketplace:

  ```bash
  /plugin marketplace add obra/superpowers-marketplace
  ```

- Install the plugin from this marketplace:

  ```bash
  /plugin install superpowers@superpowers-marketplace
  ```

### Codex CLI

Superpowers is available via the [official Codex plugin marketplace](https://github.com/openai/plugins).

- Open the plugin search interface:

  ```bash
  /plugins
  ```

- Search for Superpowers:

  ```bash
  superpowers
  ```

- Select `Install Plugin`.

### Codex App

Superpowers is available via the [official Codex plugin marketplace](https://github.com/openai/plugins).

- In the Codex app, click on Plugins in the sidebar.
- You should see `Superpowers` in the Coding section.
- Click the `+` next to Superpowers and follow the prompts.

### Factory Droid

- Register the marketplace:

  ```bash
  droid plugin marketplace add https://github.com/obra/superpowers
  ```

- Install the plugin:

  ```bash
  droid plugin install superpowers@superpowers
  ```

### Gemini CLI

- Install the extension:

  ```bash
  gemini extensions install https://github.com/obra/superpowers
  ```

- Update later:

  ```bash
  gemini extensions update superpowers
  ```

### OpenCode

OpenCode uses its own plugin install; install Superpowers separately even if you
already use it in another harness.

- Tell OpenCode:

  ```
  Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md
  ```

- Detailed docs: [docs/README.opencode.md](docs/README.opencode.md)

### Cursor

- In Cursor Agent chat, install from marketplace:

  ```text
  /add-plugin superpowers
  ```

- Or search for "superpowers" in the plugin marketplace.

### GitHub Copilot CLI

- Register the marketplace:

  ```bash
  copilot plugin marketplace add obra/superpowers-marketplace
  ```

- Install the plugin:

  ```bash
  copilot plugin install superpowers@superpowers-marketplace
  ```

## Robotics Skills

This fork includes 7 specialized robotics skills that integrate seamlessly with the Superpowers workflow:

### ROS & Systems
- **`ros-robotics-expert`** — ROS (Robot Operating System) for robotic arms and mobile robotics
  - *Trigger:* "help me with ROS", "debug my ROS issue", "should I use ROS1 or ROS2?"
  - Covers: nodes, topics, services, sensor integration, real-time constraints, Gazebo simulation

### Localization & Navigation
- **`robotics-localization-expert`** — Visual odometry, SLAM, GPS-based localization, sensor fusion
  - *Trigger:* "my robot keeps drifting", "how do I fix my SLAM?", "how do I improve localization accuracy?"
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

## Yato Token Optimization

This fork integrates [Yato](https://github.com/RedEarth-Robotics/yato) — a token optimization framework designed for large-scale robotics projects.

### Benefits for Robotics Development

- **Reduced Token Usage** — Yato's compression and filtering reduces context window consumption when working with large robotics codebases
- **AST-Aware Extraction** — Extract relevant code context from ROS packages, sensor drivers, and control systems without losing structural information
- **Smart Context Filtering** — Prioritize relevant sensor data, configuration files, and algorithm implementations during debugging sessions
- **Robotics Workflow Optimization** — Automatically manage context when analyzing multi-sensor data streams or complex ROS node graphs

### How It Works

Yato integrates with the Superpowers skills system, automatically optimizing token usage when robotics skills are invoked. When you ask your agent to debug localization drift or review ROS code, Yato ensures the most relevant context is preserved while keeping token usage efficient.

## The Robotics Workflow

The core Superpowers workflow remains unchanged, but robotics skills auto-trigger at the right moments:

1. **brainstorming** — Before writing ROS nodes or sensor fusion algorithms, the agent explores requirements and design alternatives

2. **using-git-worktrees** — Creates isolated workspace for robotics features (e.g., "add LiDAR support")

3. **writing-plans** — Breaks robotics tasks into bite-sized steps with exact file paths and verification

4. **subagent-driven-development** — Dispatches fresh agents per robotics task (implement sensor driver → review → integrate)

5. **test-driven-development** — Enforces RED-GREEN-REFACTOR for robotics code (critical for safety)

6. **robotics-skills-auto-trigger** — When you mention "ROS", "localization", "odometry", or "sensor fusion", relevant skills activate automatically

**Example:** Say "My robot is drifting in SLAM" → `robotics-localization-expert` activates → systematic diagnosis → fix plan → implementation with TDD.

**The agent checks for relevant skills before any task.** Mandatory workflows, not suggestions.

## Philosophy

- **Test-Driven Development** — Write tests first, always (especially critical for safety in robotics)
- **Systematic over ad-hoc** — Process over guessing (vital when debugging multi-sensor systems)
- **Complexity reduction** — Simplicity as primary goal (key for maintainable robotics systems)
- **Evidence over claims** — Verify before declaring success (essential for reliable robot behavior)

Read [the original release announcement](https://blog.fsck.com/2025/10/09/superpowers/).

## Original Repository

This project is a fork of [Superpowers](https://github.com/obra/superpowers) by [Jesse Vincent](https://blog.fsck.com) and the team at [Prime Radiant](https://primeradiant.com).

- **Upstream:** https://github.com/obra/superpowers
- **Purpose:** This fork adds robotics-specific skills and Yato integration to the core Superpowers methodology
- **Contributing:** Core Superpowers improvements should be submitted upstream. Robotics-specific enhancements are maintained in this fork.

**Community:**
- **Discord:** [Join the Superpowers community](https://discord.gg/35wsABTejz)
- **Issues:** https://github.com/obra/superpowers/issues
- **Release announcements:** [Sign up](https://primeradiant.com/superpowers/)

## License

MIT License - see LICENSE file for details
