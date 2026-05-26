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

This repository includes 10 domain-specific skills for robotics development:

| Skill | Description |
|-------|-------------|
| `ros-robotics-expert` | ROS (Robot Operating System) help for arms and mobile robots |
| `robotics-localization-expert` | Localization, SLAM, GPS-based positioning, and pose estimation |
| `robotics-odometry-expert` | Visual odometry, ground-based odometry, and drift analysis |
| `robotics-data-analyzer` | Sensor data analysis, telemetry processing, and hardware diagnostics |
| `robotics-devops-engineer` | Deployment, containerization, and CI/CD for robotics code |
| `fusion-filter-robotics-expert` | Sensor fusion, Kalman filters, and multi-sensor integration |
| `gps-ins-localization-expert` | GPS and INS integration for robotics localization |
| `cpp-misra-auditor` | C++ safety auditing and MISRA compliance for embedded systems |
| `security-pentester` | Security assessments and vulnerability identification |
| `token-optimizer` | Token optimization via Yato MCP server integration |

## License

MIT License - see LICENSE file for details
