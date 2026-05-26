## 2026-05-26 — robotics-devops-engineer → robotics-field-engineer rename

Renamed robotics-devops-engineer to robotics-field-engineer to avoid confusion with general devops-engineer skill. Updated all cross-references in skills, documentation, and routing tables. Verified no remaining references to old name.

## 2026-05-26 — Added software-architect and devops-engineer skills

Created two new general-purpose software engineering skills: software-architect (system architecture and design) and devops-engineer (general DevOps/CI/CD). These complement existing robotics-specific skills while providing broader software engineering capabilities.

## 2026-05-26 — Strategic skill expansion analysis

Analyzed potential skill additions across robotics, UX, cybersecurity, networks, and programming languages. Identified 18 high-priority skills including robotics-control-engineer, robotics-vision-expert, ux-designer, iot-security-expert, network-engineer, and language experts (Java, Go, Rust, JavaScript). Skills prioritized based on robotics domain relevance and complementarity to existing skill set.

## 2026-05-26 — Robotics skills redundancy analysis

Identified overlap between robotics-localization-expert and robotics-odometry-expert (both cover visual odometry). Recommended removing visual odometry from odometry-expert to clarify boundaries. Confirmed gps-ins-localization-expert and fusion-filter-robotics-expert have distinct focuses (domain vs algorithm). All 6 proposed new robotics skills are non-redundant with existing set.

## 2026-05-26 — Implemented 15 new skills via parallel subagents

Dispatched 4 parallel subagents to create 15 new skills (6 robotics + 3 network + 4 language + 1 security + 1 web):

**Robotics Advanced (6):**
- robotics-control-engineer: Control theory, PID, MPC, LQR, trajectory optimization (150 lines)
- robotics-vision-expert: Computer vision, object detection, visual SLAM, camera calibration (149 lines)
- robotics-simulation-expert: Gazebo, Webots, MuJoCo, sim-to-real transfer (155 lines)
- robotics-path-planning: A*, RRT, PRM, motion planning algorithms (150 lines)
- robotics-manipulator: Robotic arms, inverse kinematics, grasp planning (152 lines)
- robotics-communication: ROS 2, DDS, MQTT, swarm coordination, mesh networking (152 lines)

**Network & Communication (3):**
- network-engineer: TCP/IP, routing, switching, topology design (130 lines)
- wireless-network-expert: WiFi, LoRa, Zigbee, RF engineering, mesh protocols (134 lines)
- embedded-networking: CAN bus, Modbus, EtherCAT, industrial protocols (134 lines)

**Security (1):**
- robotics-security-auditor: Robot security, sensor spoofing, actuator security, secure ROS (154 lines)

**Programming Languages (4):**
- rust-expert: Ownership, borrowing, unsafe auditing, embedded Rust (147 lines)
- go-expert: Goroutines, channels, microservices, race detection (136 lines)
- java-expert: JVM tuning, Spring Boot, virtual threads, concurrency (141 lines)
- javascript-expert: React, TypeScript, Node.js, web robotics interfaces (140 lines)

**Web (1):**
- web-expert: Full-stack dashboards, WebSockets, real-time visualization (137 lines)

All skills include full format compliance: YAML frontmatter, trigger phrases, core responsibilities, methodology, Red Flags tables, skill boundaries, anti-patterns, output format requirements, quality control mechanisms. All have ROBOTICS marker files for installer compatibility.

Installer dry-run confirms all 32 skills are detected (23 new to be linked, 8 already linked, 1 skipped). README.md updated with all new skills organized into clear categories.

## 2026-05-26 — Pushed commits to main

Committed and pushed 3 commits to main:
1. Add 15 new skills and reorganize robotics-superpowers (main commit)
2. Fix ROBOTICS marker file location and remove backup files
3. Add cpp-pro ROBOTICS marker file

Final state: 32 skills organized into 6 categories, all with proper ROBOTICS markers for installer compatibility.