# Dotfiles

My personal dotfiles configuration managed with GNU Stow.

## Structure

- `base/`: Configuration files common to all systems
- `macos/`: macOS-specific configuration files
- `linux/`: Linux-specific configuration files

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

Clone this repository to my preferred location (recommended: `~/.config/dots`):

```bash
git clone https://github.com/REDACTED/dots.git ~/.config/dots
cd ~/.config/dots
```

### Standard Installation

To install the dotfiles:

```bash
./bin/install
```

This will automatically:
1. Install the base configuration
2. Detect my operating system (macOS or Linux)
3. Install OS-specific configuration if available

### Installation Options

| Option     | Description                                           |
|------------|-------------------------------------------------------|
| --adopt    | Move existing files into the repository               |
| --simulate | Show what would happen without making changes         |

#### Examples

```bash
# Standard installation
./bin/install

# Adopt existing files
./bin/install --adopt

# Simulate installation
./bin/install --simulate

# Simulate adoption of existing files
./bin/install --adopt --simulate
```

### Removing Dotfiles

To remove the symlinks created by stow:

```bash
./bin/clean
```

## Package Installation

Bootstrap terminal utilities for your platform:

```bash
./bin/bootstrap           # Install all packages
./bin/bootstrap --dry-run # Preview what would be installed
```

**Supported Platforms:**
- macOS (homebrew)
- Arch Linux (pacman)  
- Debian/Ubuntu (apt)

**Installs these terminal utilities:**
- Core: git, curl, wget, tmux, zsh, unzip, jq, stow
- Modern CLI: bat, eza, ripgrep, fd, git-delta, fzf, starship, zoxide
- Development: neovim, github-cli, lazygit
- File management: yazi

