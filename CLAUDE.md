# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that uses GNU Stow to manage configuration files for various command-line tools and development environments. The repository supports both macOS and Linux systems with automatic OS detection.

## Key Commands

### Installation and Management
```bash
# Install dotfiles (creates symlinks)
./bin/install

# Install with adopt mode (moves existing files into repo)
./bin/install --adopt

# Dry run installation
./bin/install --simulate

# Remove all symlinks
./bin/clean
```

### Development Workflow
1. Make changes to configuration files in appropriate directories (base/, macos/, linux/)
2. Test changes with `./bin/install --simulate`
3. Apply changes with `./bin/install`
4. For new config files, use `./bin/install --adopt` to move existing files into the repo
5. Commit changes with git

## Architecture and Structure

### Directory Organization
- **`/base/`**: Cross-platform configurations (stowed to $HOME)
  - `.config/nvim/`: Neovim with LazyVim framework
  - `.config/zsh/`: Modular ZSH configuration (conf.d/ structure)
  - `.config/yazi/`: Yazi file manager settings
  - `.local/bin/`: Custom scripts
  - `.tmux.conf`: Tmux configuration
  - `.zshrc`: Main shell configuration

- **`/macos/`**: macOS-specific configurations
- **`/linux/`**: Linux-specific configurations
- **`/bin/`**: Management scripts (install, clean)

### Key Technologies
- **GNU Stow**: Symlink management (only dependency)
- **Neovim + LazyVim**: Primary editor with extensive language support
- **ZSH**: Shell with modular configuration in conf.d/
- **Tmux**: Terminal multiplexer with project-based sessions
- **Development tools**: Git/Lazygit, FZF, Zoxide, Starship prompt

### Configuration Patterns
- Follows XDG Base Directory specification
- Modular ZSH configuration via conf.d/ directory
- Project navigation through tmux sessions (tmproj alias)
- Extensive git aliases and integrations

## Important Notes
- Always ensure GNU Stow is installed before running scripts
- The install script creates necessary directories automatically
- Use `--adopt` carefully as it moves files into the repository
- OS detection is automatic (Darwin for macOS, Linux for others)