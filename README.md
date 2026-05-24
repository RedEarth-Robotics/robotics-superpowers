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

## License

MIT License - see LICENSE file for details
