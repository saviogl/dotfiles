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
