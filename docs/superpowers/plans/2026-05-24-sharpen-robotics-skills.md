# Sharpen Robotics Skills — Surgical Refinement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add Red Flags tables, Skill Boundaries, Anti-Patterns, and Output Format Requirements to all 7 specialized robotics skills for maximum precision.

**Architecture:** Surgical additions to each existing skill file — preserve all existing content, add 4 standardized precision sections to each.

**Tech Stack:** Markdown skill files

---

### Task 1: Refine ros-robotics-expert

**Files:**
- Modify: `skills/ros-robotics-expert/SKILL.md`

Add these 4 sections before the existing "Output format requirements" section (around line 50):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "This is just a launch file issue" | Launch files are code with side effects. Use the skill. |
| "I'll just check rostopic/rosgraph first" | The skill tells you WHAT to check and WHY. |
| "I know ROS2 already" | ROS2 evolves rapidly. The skill has current best practices. |
| "It's probably a tf issue" | Tf debugging is non-trivial and platform-specific. Use the skill. |
| "I can fix this node quickly" | Quick fixes in ROS create cascading failures. Use the skill. |
| "The error message is self-explanatory" | ROS error messages are often misleading. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers ROS-specific systems and nodes. It does NOT cover:
- Non-ROS robotics frameworks (Pure Arduino, PLC, custom middleware)
- High-level AI/ML model training (use `python-expert`)
- Mechanical/electrical hardware design (beyond sensor integration)
- Non-robotics software development

If the user is asking about non-ROS frameworks or non-robotics code, redirect to the appropriate skill.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT suggest quick patches without understanding the node graph.** ROS failures cascade.
- **Do NOT ignore tf frame conventions.** Misaligned frames cause silent failures in downstream nodes.
- **Do NOT recommend blocking I/O in callbacks.** It degrades real-time performance unpredictably.
- **Do NOT skip launch file validation.** Untested launch files are the #1 source of deployment failures.
- **Do NOT assume ROS1 = ROS2.** They have incompatible APIs, build systems, and threading models.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/ros-robotics-expert/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to ros-robotics-expert"
```

---

### Task 2: Refine robotics-localization-expert

**Files:**
- Modify: `skills/robotics-localization-expert/SKILL.md`

Add these 4 sections before the existing "Output Format Requirements" section (around line 77):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "This is just a parameter tuning problem" | Parameter tuning without understanding the pipeline is guessing. Use the skill. |
| "I'll just increase the covariance" | Increasing covariance masks root causes. Use the skill. |
| "Visual odometry always drifts" | VO drift is solvable with proper tuning and loop closure. Use the skill. |
| "GPS is always accurate" | GPS has multipath, atmospheric delay, and urban canyon issues. Use the skill. |
| "I can fix this with a bigger map" | Map size doesn't fix localization quality. Use the skill. |
| "The SLAM algorithm is broken" | Most SLAM failures are sensor or calibration issues, not algorithm bugs. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers robot position/orientation estimation. It does NOT cover:
- Path planning or motion control (use appropriate domain skills)
- General robotics architecture beyond localization pipeline
- Sensor hardware selection or procurement
- Non-robotics computer vision (e.g., image classification)

Focus on: sensors → processing → state estimation → output. Stay within the localization pipeline.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT suggest increasing covariance as a fix.** It masks real problems and makes filters overconfident elsewhere.
- **Do NOT ignore timestamp synchronization.** Even 10ms skew between sensors corrupts fusion estimates.
- **Do NOT recommend manual coordinate frame adjustments.** Frames must be physically measured and calibrated.
- **Do NOT skip loop closure verification.** False loop closures cause catastrophic map distortion.
- **Do NOT assume indoor = outdoor parameters.** Lighting, texture, and dynamics differ fundamentally.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/robotics-localization-expert/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to robotics-localization-expert"
```

---

### Task 3: Refine robotics-odometry-expert

**Files:**
- Modify: `skills/robotics-odometry-expert/SKILL.md`

Add these 4 sections before the existing "Output format for log analysis" section (around line 59):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "This is just wheel slip" | Wheel slip is a symptom, not a diagnosis. Use the skill. |
| "Visual odometry is always noisy" | VO noise patterns reveal calibration and tuning issues. Use the skill. |
| "I'll just filter the data more" | Over-filtering destroys information. Use the skill. |
| "The IMU is calibrated" | IMU calibration drifts with temperature and vibration. Use the skill. |
| "Dead reckoning is good enough" | Dead reckoning accumulates error exponentially. Use the skill. |
| "It's just a scale factor error" | Scale factor errors compound over distance. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers motion estimation from proprioceptive and exteroceptive sensors. It does NOT cover:
- Global localization or SLAM (use `robotics-localization-expert`)
- Sensor fusion architecture design (use `fusion-filter-robotics-expert`)
- Non-odometry sensors (e.g., pure GPS without motion model)
- Vehicle dynamics or control systems

Focus on: motion → estimation → drift analysis. Stay within the odometry domain.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT recommend low-pass filtering as the primary solution.** It introduces phase lag that destabilizes control.
- **Do NOT ignore wheel diameter calibration.** Even 1% error causes 1m drift per 100m traveled.
- **Do NOT assume IMU bias is constant.** Bias drifts with temperature; must be estimated online.
- **Do NOT skip kinematic model validation.** Wrong kinematics (e.g., Ackermann vs differential) corrupt everything.
- **Do NOT fuse odometry with GPS without proper motion model.** Unmodelled dynamics cause filter divergence.
```

**Step 4 — Output Format Requirements:**

```markdown
## Output Format Requirements

Structure your responses as:
1. **Odometry Assessment**: Current accuracy vs. requirement
2. **Drift Pattern Analysis**: Identify systematic vs. random error components
3. **Sensor-Specific Diagnosis**: Per-sensor health check
4. **Calibration Verification**: Which calibrations need rechecking
5. **Recommended Fix**: Primary approach with expected improvement
6. **Implementation Steps**: Concrete changes with file references
7. **Verification Metrics**: How to measure improvement quantitatively
```

**Step 5 — Verify and Commit:**

```bash
git add skills/robotics-odometry-expert/SKILL.md
git commit -m "Add Red Flags, boundaries, anti-patterns, and output format to robotics-odometry-expert"
```

---

### Task 4: Refine robotics-data-analyzer

**Files:**
- Modify: `skills/robotics-data-analyzer/SKILL.md`

Add these 4 sections before the existing "Output format for robotics data analysis" section (around line 71):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "I can eyeball this data" | Human pattern recognition fails on high-dimensional sensor data. Use the skill. |
| "The sensor is obviously broken" | Sensor failures often look like calibration issues. Use the skill. |
| "I'll just plot it" | Plotting without statistical rigor finds false patterns. Use the skill. |
| "The timestamp is probably fine" | Timestamp analysis is non-trivial and critical. Use the skill. |
| "One bad reading doesn't matter" | Single outliers reveal systematic issues. Use the skill. |
| "I don't need ground truth" | Without ground truth, you can't separate noise from bias. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers sensor data analysis for robotics systems. It does NOT cover:
- General data science (use `python-expert` or `data-pipeline-architect`)
- Machine learning model training or evaluation
- Non-robotics sensor data (e.g., purely environmental monitoring)
- Real-time control algorithms

Focus on: multi-sensor → temporal alignment → statistical analysis → root cause. Stay within robotics sensor analysis.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT remove outliers without investigation.** Outliers are diagnostic signals, not noise.
- **Do NOT analyze sensors in isolation.** Cross-sensor correlation reveals timing and calibration issues.
- **Do NOT use naive averaging for angular data.** Circular statistics require different handling.
- **Do NOT ignore sample rate mismatches.** Different rates cause aliasing and false correlations.
- **Do NOT assume Gaussian noise.** Sensor noise is often multi-modal or heteroscedastic.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/robotics-data-analyzer/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to robotics-data-analyzer"
```

---

### Task 5: Refine fusion-filter-robotics-expert

**Files:**
- Modify: `skills/fusion-filter-robotics-expert/SKILL.md`

Add these 4 sections before the existing "Output Format Requirements" section (around line 74):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "EKF is always the right choice" | EKF linearization errors cause divergence in highly nonlinear systems. Use the skill. |
| "I'll just tune covariance by trial and error" | Covariance tuning requires physical understanding. Use the skill. |
| "More sensors = better estimates" | Unmodelled sensors inject correlated noise. Use the skill. |
| "The filter converges, so it's right" | Convergence to wrong state is worse than divergence. Use the skill. |
| "I can copy covariance values from a paper" | Covariances are system-specific and environment-dependent. Use the skill. |
| "UKF is too slow for real-time" | UKF sigma point count is tunable. Don't dismiss it prematurely. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers state estimation via fusion filters. It does NOT cover:
- Pure sensor calibration (use `robotics-data-analyzer`)
- Non-filter-based localization (use `robotics-localization-expert`)
- Control system design or stability analysis
- General signal processing (use `python-expert`)

Focus on: state vector → process model → measurement model → filter implementation → validation. Stay within the filter design domain.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT copy covariance matrices from examples without physical justification.** Every system has different noise characteristics.
- **Do NOT ignore process model mismatch.** Wrong dynamics cause bias even with perfect measurements.
- **Do NOT fuse sensors without modeling their cross-correlation.** Unmodelled correlation causes overconfidence.
- **Do NOT skip observability analysis.** Unobservable states will drift regardless of filter quality.
- **Do NOT use quaternion measurements without proper error state representation.** Naive quaternion averaging violates the manifold structure.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/fusion-filter-robotics-expert/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to fusion-filter-robotics-expert"
```

---

### Task 6: Refine gps-ins-localization-expert

**Files:**
- Modify: `skills/gps-ins-localization-expert/SKILL.md`

Add these 4 sections before the existing "Output Format" section (around line 58):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "GPS is accurate to centimeters" | Consumer GPS is 3-5m; RTK requires base station infrastructure. Use the skill. |
| "INS drift is linear" | INS drift grows with time cubed for position. Use the skill. |
| "I can fix GPS denial with more satellites" | Urban canyons and indoors block signals regardless of satellite count. Use the skill. |
| "The fusion filter will handle bad GPS" | Bad GPS corrupts the INS bias estimates before the filter rejects it. Use the skill. |
| "A cheap IMU is fine for short missions" | MEMS IMU bias instability makes even 1-minute missions problematic. Use the skill. |
| "I don't need to model lever arm" | Unmodelled lever arm causes apparent rotation during acceleration. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers GPS/INS integration for localization. It does NOT cover:
- Non-GPS localization (use `robotics-localization-expert`)
- General sensor fusion (use `fusion-filter-robotics-expert`)
- GPS receiver hardware selection or procurement
- Non-robotics surveying or geodesy

Focus on: GPS signals → INS integration → fusion filter → error characterization. Stay within the GPS/INS domain.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT rely on GPS velocity for high-dynamic maneuvers.** GPS velocity has latency and smoothing that corrupts fast motion.
- **Do NOT ignore GPS outage transitions.** Smooth reacquisition requires innovation gating and gradual re-integration.
- **Do NOT model only position in the INS state.** Gyro and accelerometer biases MUST be estimated online.
- **Do NOT assume the GPS antenna and IMU are collocated.** Lever arm effects cause errors proportional to angular acceleration.
- **Do NOT use constant covariance for GPS.** Signal quality (C/N0, DOP) varies and must be reflected in measurement noise.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/gps-ins-localization-expert/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to gps-ins-localization-expert"
```

---

### Task 7: Refine robotics-field-engineer

**Files:**
- Modify: `skills/robotics-field-engineer/SKILL.md`

Add these 4 sections before the existing "Output Format Requirements" section (around line 56):

**Step 1 — Red Flags Table:**

```markdown
## Red Flags

These thoughts mean STOP — you're rationalizing:

| Thought | Reality |
|---------|---------|
| "Containerizing ROS is straightforward" | ROS containers require device access, networking, and real-time tuning. Use the skill. |
| "CI/CD for robots is like CI/CD for web apps" | Hardware-in-the-loop testing changes everything. Use the skill. |
| "I'll just use Docker Compose for the fleet" | Robot fleets need orchestration with safety interlocks. Use the skill. |
| "Kubernetes is overkill for robots" | Multi-robot coordination at scale requires orchestration. Use the skill. |
| "We don't need rollback for robots" | Physical robots can't be rolled back like software. Use the skill. |
| "DevOps doesn't apply to embedded" | Embedded robotics needs CI/CD more than cloud apps. Use the skill. |
```

**Step 2 — Skill Boundaries:**

```markdown
## Skill Boundaries

This skill covers deployment and infrastructure for robotics systems. It does NOT cover:
- Application software development (use domain-specific skills)
- General IT/DevOps without robotics context (use `linux-ubuntu-expert`)
- Hardware manufacturing or assembly
- Non-containerized embedded systems without deployment pipeline

Focus on: build → test (HIL) → containerize → deploy → monitor. Stay within the robotics DevOps domain.
```

**Step 3 — Anti-Patterns:**

```markdown
## Anti-Patterns (What NOT to Do)

- **Do NOT containerize without device access planning.** ROS needs cameras, LiDAR, serial ports — all require explicit device mapping.
- **Do NOT skip hardware-in-the-loop testing.** Software-only CI for robots guarantees field failures.
- **Do NOT deploy without health checks.** Robot failures are physical; automated recovery is mandatory.
- **Do NOT use generic base images.** ROS images must include the specific distro, tools, and environment.
- **Do NOT ignore network topology.** Robot-to-robot and robot-to-cloud communication has latency and reliability constraints.
```

**Step 4 — Verify and Commit:**

```bash
git add skills/robotics-field-engineer/SKILL.md
git commit -m "Add Red Flags, boundaries, and anti-patterns to robotics-field-engineer"
```

---

### Task 8: Final Verification

**Files:**
- Review: All 7 modified skill files

- [ ] **Step 1: Verify all skills have 4 new sections**

Check each file for:
- Red Flags table (6+ entries)
- Skill Boundaries section
- Anti-Patterns section (5+ entries)
- Consistent formatting (## headers)

- [ ] **Step 2: Check git log**

```bash
git log --oneline -10
```

- [ ] **Step 3: Commit implementation plan**

```bash
git add docs/superpowers/plans/2026-05-24-sharpen-robotics-skills.md
git commit -m "Add implementation plan for sharpening robotics skills"
```
