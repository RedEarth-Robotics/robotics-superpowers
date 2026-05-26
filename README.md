# Superpowers for Robotics

A specialized fork of [Superpowers](https://github.com/obra/superpowers) with domain-specific skills for robotics development, integrated with [Yato](https://github.com/RedEarth-Robotics/yato) token optimization.

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

## Skills

This repository includes domain-specific skills for robotics development and general-purpose software engineering skills:

### Robotics Core Skills

| Skill | Description |
|-------|-------------|
| `ros-robotics-expert` | ROS (Robot Operating System) help for arms and mobile robots |
| `robotics-localization-expert` | Localization, SLAM, GPS-based positioning, and pose estimation |
| `robotics-odometry-expert` | Ground-based odometry, wheel encoders, IMU integration, and drift analysis |
| `robotics-data-analyzer` | Sensor data analysis, telemetry processing, and hardware diagnostics |
| `robotics-field-engineer` | Field deployment, containerization, and CI/CD for robotics field operations |
| `fusion-filter-robotics-expert` | Sensor fusion, Kalman filters, and multi-sensor integration |
| `gps-ins-localization-expert` | GPS and INS integration for robotics localization |

### Robotics Advanced Skills

| Skill | Description |
|-------|-------------|
| `robotics-control-engineer` | Control theory, PID controllers, MPC, LQR, and trajectory optimization |
| `robotics-vision-expert` | Computer vision for robotics, object detection, visual SLAM, and camera calibration |
| `robotics-simulation-expert` | Gazebo, Webots, MuJoCo, physics simulation, and sim-to-real transfer |
| `robotics-path-planning` | A*, RRT, PRM, motion planning algorithms, and collision avoidance |
| `robotics-manipulator` | Robotic arms, inverse kinematics, grasp planning, and arm dynamics |
| `robotics-communication` | Robot-to-robot communication, DDS, MQTT, swarm coordination, and mesh networking |

### Software Engineering Skills

| Skill | Description |
|-------|-------------|
| `software-architect` | System architecture, design patterns, and architectural decision guidance |
| `devops-engineer` | CI/CD, containerization, infrastructure automation, and deployment strategies |
| `python-expert` | Python code review, debugging, optimization, and best practices |
| `cpp-pro` | C/C++ code review for bugs, security issues, and performance problems |
| `rust-expert` | Rust code review, memory safety, embedded systems, and async Rust |
| `go-expert` | Go code review, concurrency, microservices, and performance optimization |
| `java-expert` | Java code review, JVM tuning, Spring Boot, and enterprise systems |
| `javascript-expert` | JavaScript/TypeScript, React, Node.js, and web robotics interfaces |
| `web-expert` | Full-stack web development for robotics dashboards and real-time interfaces |
| `data-pipeline-architect` | Data pipeline design, ETL processes, and data infrastructure |
| `linux-ubuntu-expert` | Linux/Ubuntu system administration, configuration, and troubleshooting |
| `matlab-expert` | MATLAB code, Simulink models, and technical computing help |

### Network & Communication Skills

| Skill | Description |
|-------|-------------|
| `network-engineer` | Network design, TCP/IP, routing, switching, and topology for robotics |
| `wireless-network-expert` | WiFi, LoRa, Zigbee, RF engineering, and mesh protocols for robotics |
| `embedded-networking` | CAN bus, Modbus, EtherCAT, industrial protocols, and real-time networking |

### Security & Quality Skills

| Skill | Description |
|-------|-------------|
| `cpp-expert` | C++ code review for bugs, security issues, and performance problems |
| `cpp-misra-auditor` | C++ safety auditing and MISRA compliance for embedded systems |
| `security-pentester` | Security assessments and vulnerability identification |
| `robotics-security-auditor` | Robot security, sensor spoofing, actuator security, and secure ROS |

### Core Skills

| Skill | Description |
|-------|-------------|
| `token-optimizer` | Token optimization via Yato MCP server integration |

## License

MIT License - see LICENSE file for details