# Dotfiles

My personal dotfiles configuration managed with GNU Stow.

## Structure

- `base/`: Configuration files common to all systems
- `macos/`: macOS-specific configuration files
- `linux/`: Linux-specific configuration files

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- `make`

## Installation

Clone this repository to my preferred location (recommended: `~/.config/dots`):

```bash
git clone https://github.com/REDACTED/dots.git ~/.config/dots
cd ~/.config/dots
```

### Standard Installation

To install the dotfiles:

```bash
make install
```

This will automatically:
1. Install the base configuration
2. Detect my operating system (macOS or Linux)
3. Install OS-specific configuration if available

### Installation Options

| Flag     | Values       | Default | Description                                           |
|----------|--------------|---------|-------------------------------------------------------|
| ADOPT    | true, false  | false   | Move existing files into the repository               |
| SIMULATE | true, false  | false   | Show what would happen without making changes         |

#### Examples

```bash
# Standard installation
make install

# Adopt existing files
make install ADOPT=true

# Simulate installation
make install SIMULATE=true

# Simulate adoption of existing files
make install ADOPT=true SIMULATE=true
```

### Removing Dotfiles

To remove the symlinks created by stow:

```bash
make clean
```
