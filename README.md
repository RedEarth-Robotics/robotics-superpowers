# Superpowers for Robotics

A specialized fork of [Superpowers](https://github.com/obra/superpowers) with domain-specific skills for robotics development, integrated with [Yato](https://github.com/RedEarth-Robotics/yato) token optimization.

## Installation

### Quick Install

```bash
git clone https://github.com/RedEarth-Robotics/robotics-superpowers.git
cd robotics-superpowers
./install.sh
```

### Manual Install

Symlink individual skills from `skills/` into `~/.config/devin/skills/`.

### Uninstall

```bash
./install.sh --uninstall
```

### Options

- `--dry-run` — Show what would happen without making changes
- `--uninstall` — Remove all symlinks created by this installer
- `--help` — Show usage information

## Skills

47 skills organized into 7 categories:

### Workflow (15)

| Skill | Description |
|-------|-------------|
| `brainstorming` | Explore user intent, requirements, and design before implementation |
| `writing-plans` | Create implementation plans from specs before touching code |
| `executing-plans` | Execute written implementation plans with review checkpoints |
| `subagent-driven-development` | Execute implementation plans with independent parallel tasks |
| `systematic-debugging` | Debug bugs, test failures, or unexpected behavior systematically |
| `test-driven-development` | Write failing tests before implementing features or bugfixes |
| `finishing-a-development-branch` | Complete development work and decide on merge/PR/cleanup |
| `verification-before-completion` | Run verification commands before claiming work is complete |
| `requesting-code-review` | Request code review after implementing major features |
| `receiving-code-review` | Receive code review feedback with technical rigor |
| `using-git-worktrees` | Create isolated workspaces via git worktrees for feature work |
| `writing-skills` | Create, edit, or verify skills for deployment |
| `using-superpowers` | Find and use skills before any response including clarifying questions |
| `token-optimizer` | Minimize LLM token usage and maximize context quality |
| `dispatching-parallel-agents` | Execute 2+ independent tasks without shared state |

### Robotics Core (7)

| Skill | Description |
|-------|-------------|
| `ros-robotics-expert` | ROS (Robot Operating System) for arms and mobile robots |
| `robotics-localization-expert` | Localization, SLAM, GPS-based positioning, pose estimation |
| `robotics-odometry-expert` | Ground-based odometry, wheel encoders, IMU integration, drift analysis |
| `robotics-data-analyzer` | Sensor data analysis, telemetry processing, hardware diagnostics |
| `robotics-field-engineer` | Field deployment, containerization, CI/CD for robotics operations |
| `fusion-filter-robotics-expert` | Sensor fusion, Kalman filters, multi-sensor integration |
| `gps-ins-localization-expert` | GPS and INS integration for robotics localization |

### Robotics Advanced (6)

| Skill | Description |
|-------|-------------|
| `robotics-control-engineer` | Control theory, PID, MPC, LQR, trajectory optimization |
| `robotics-vision-expert` | Computer vision, object detection, visual SLAM, camera calibration |
| `robotics-simulation-expert` | Gazebo, Webots, MuJoCo, physics simulation, sim-to-real transfer |
| `robotics-path-planning` | A*, RRT, PRM, motion planning algorithms, collision avoidance |
| `robotics-manipulator` | Robotic arms, inverse kinematics, grasp planning, arm dynamics |
| `robotics-communication` | Robot-to-robot communication, DDS, MQTT, swarm coordination |

### Software Engineering (12)

| Skill | Description |
|-------|-------------|
| `software-architect` | System architecture, design patterns, architectural decisions |
| `devops-engineer` | CI/CD, containerization, infrastructure automation, deployment |
| `python-expert` | Python code review, debugging, optimization, best practices |
| `cpp-expert` | C/C++ code review for bugs, security issues, performance |
| `rust-expert` | Rust code review, memory safety, embedded systems, async Rust |
| `go-expert` | Go code review, concurrency, microservices, performance |
| `java-expert` | Java code review, JVM tuning, Spring Boot, enterprise systems |
| `javascript-expert` | JavaScript/TypeScript, React, Node.js, web robotics interfaces |
| `web-expert` | Full-stack web development for robotics dashboards, real-time interfaces |
| `data-pipeline-architect` | Data pipeline design, ETL processes, data infrastructure |
| `linux-ubuntu-expert` | Linux/Ubuntu system administration, configuration, troubleshooting |
| `matlab-expert` | MATLAB code, Simulink models, technical computing |

### Network & Communication (3)

| Skill | Description |
|-------|-------------|
| `network-engineer` | Network design, TCP/IP, routing, switching, topology |
| `wireless-network-expert` | WiFi, LoRa, Zigbee, RF engineering, mesh protocols |
| `embedded-networking` | CAN bus, Modbus, EtherCAT, industrial protocols, real-time networking |

### Security & Quality (3)

| Skill | Description |
|-------|-------------|
| `cpp-misra-auditor` | C++ safety auditing, MISRA compliance for embedded systems |
| `security-pentester` | Security assessments, vulnerability identification |
| `robotics-security-auditor` | Robot security, sensor spoofing, actuator security, secure ROS |

## License

MIT License - see LICENSE file for details