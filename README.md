# Mythe 🛠️

> A fast, simple Terminal Task Manager for macOS — inspired by Homebrew.

Mythe lets you install, run, and manage hundreds of tasks straight from your Terminal. Use community tasks or create your own.

---

## Installation

1. Download the latest release from [GitHub](https://github.com/M-lanGH/Mythe)
2. Open Terminal and run:

```bash
cd ~/Downloads/mythe
bash install.sh
```

3. Done! Try it out:

```bash
mythe help
```

---

## Commands

| Command | Description |
|---|---|
| `mythe install <name>` | Install a task from the community |
| `mythe run <name>` | Run an installed task |
| `mythe list` | Show all tasks (installed + available) |
| `mythe add <name>` | Add your own local task |
| `mythe remove <name>` | Remove an installed task |
| `mythe version` | Show the current version |
| `mythe help` | Show all commands |

---

## Examples

```bash
# Install a task
mythe install "backup-home"

# Run a task
mythe run "backup-home"

# See all tasks
mythe list

# Create your own task
mythe add "my-script"
```

---

## Task Library

Mythe has two types of tasks:

- **Community tasks** — shared by the community, installable via `mythe install`
- **Local tasks** — your own scripts, created via `mythe add`

---

## Requirements

- macOS
- Bash 3.2+

---

## Version

**v0.1.0** — Initial release

---

Made by M-lanGH (https://github.com/M-lanGH)  And  Pyx.Inc (https://github.com/Pyx.Inc)
