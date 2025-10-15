# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles managed with GNU Stow for cross-platform terminal environments (macOS/Linux). Emphasizes modular configuration, consistent theming (Catppuccin), and workflow integration between tmux, git worktrees, and Neovim.

## Key Commands

### Installation and Management
```bash
./bin/install              # Install dotfiles (creates symlinks)
./bin/install --adopt      # Move existing files into repo
./bin/install --simulate   # Dry run to preview changes
./bin/clean                # Remove all symlinks
./bin/bootstrap            # Install packages (macOS/Arch/Debian)
./bin/bootstrap --dry-run  # Preview package installation
```

### Neovim Plugin Management (LazyVim)
```bash
# Inside Neovim
:Lazy                      # Open plugin manager
:Lazy update               # Update all plugins
:LazyExtras                # Browse and install extras
```

Plugin files are in `base/.config/nvim/lua/plugins/` and follow LazyVim's plugin spec format. Each file returns a table with plugin configuration.

## Architecture and Structure

### Stow-based Symlink Management

The repository uses GNU Stow to create symlinks from package directories to `$HOME`:
- **`base/`**: Symlinked to `$HOME` (cross-platform configs)
- **`macos/`**: Symlinked to `$HOME` (macOS-specific, auto-detected)
- **`linux/`**: Symlinked to `$HOME` (Linux-specific, auto-detected)

The install script (`bin/install`) automatically detects OS (Darwin→macos, Linux→linux) and applies both base and OS-specific packages. All paths within these directories mirror their target location (e.g., `base/.config/nvim/` → `~/.config/nvim/`).

### ZSH Modular Configuration System

ZSH configuration is split across numbered modules in `base/.config/zsh/conf.d/`:
- Modules are sourced in lexicographical order (01-*, 02-*, etc.)
- `01-aliases.zsh`: Core aliases and complex functions (wt, wtl, wtrm, tmproj)
- `02-starship.zsh`: Prompt initialization
- `03-completions.zsh`: Enhanced completion system
- `10-yazi.zsh`: File manager integration
- `11-fzf.zsh`: Fuzzy finder setup
- `13-homebrew.zsh`: macOS package manager paths
- `16-modern-tools.zsh`: bat/eza/delta configurations with fallbacks

Main `.zshrc` sources these modules in order. When adding new functionality, create a new numbered module rather than editing existing ones to maintain modularity.

### Neovim Plugin Architecture (LazyVim)

Uses LazyVim framework with custom plugin overrides in `base/.config/nvim/lua/plugins/`:
- Each `.lua` file defines one or more plugins using LazyVim's spec format
- Key plugins: fzf-lua (file finding), yazi.nvim (file manager), vim-tmux-navigator (pane navigation)
- Plugin files are automatically loaded by LazyVim via `lua/config/lazy.lua`
- Custom keymaps defined within plugin specs using `keys` table

LazyVim checks for updates automatically (`checker.enabled = true`). Plugin lockfile is `lazy-lock.json`.

### Git Worktree Workflow

The `wt` function in `01-aliases.zsh` implements an integrated git worktree + tmux workflow:
1. Creates worktree in sibling directory: `../wt-<repo>--<branch>`
2. Creates dedicated tmux session: `wt-<repo>--<branch>`
3. Switches to session (handles both inside/outside tmux)

Companion functions:
- `wtl`: List all worktrees
- `wtrm`: Interactive removal with fzf picker, cleans up both worktree and tmux session

This pattern isolates feature work into separate directories with persistent tmux sessions.

### Tmux Custom Layout System

Tmux configuration (`.tmux.conf`) implements DWM-inspired master-stack layout:
- **Master pane**: Primary working area (60% width by default)
- **Stack panes**: Secondary panes in vertical split
- `C-a m`: Create new pane as master (pushes current to stack)
- `C-a M`: Promote current pane to master
- `C-a Tab`: Cycle which pane is master
- `C-a =`: Reset to master-vertical layout

Popup integrations for temporary tools:
- `C-a g`: Lazygit popup (90% screen)
- `C-a G`: GitHub dashboard (gh dash)
- `C-a Enter`: Bottom terminal (15 lines)
- `C-a M-Enter`: Scratch session

Smart vim-tmux navigation enabled via vim-tmux-navigator pattern (checks for vim process).

### Cross-Platform Package Management

`bin/bootstrap` handles package installation across platforms:
- **Platform detection**: Checks `uname -s` and `/etc/os-release`
- **Package manager abstraction**: brew (macOS), pacman (Arch), apt (Debian/Ubuntu)
- **Platform-specific packages**: Handles name variations (e.g., `eza` vs `exa`, `gh` vs `github-cli`)
- **Special installations**: Debian requires curl-based installs for starship/zoxide

Core packages installed: git, tmux, zsh, neovim, fzf, bat, eza, ripgrep, fd, git-delta, starship, zoxide, gh, lazygit, yazi

## Important Patterns

### Adding New Configuration

1. **New tool config**: Add to appropriate directory in `base/.config/`
2. **New shell functionality**: Create new numbered file in `base/.config/zsh/conf.d/`
3. **New Neovim plugin**: Create file in `base/.config/nvim/lua/plugins/` returning LazyVim spec
4. **New platform-specific config**: Add to `macos/` or `linux/` mirroring home path structure

### Testing Changes

Always use `./bin/install --simulate` before applying changes to preview symlink creation/modification. The `--adopt` flag is dangerous as it moves existing files into the repository.

### Tmux Session Management

Project sessions are managed via `tmproj` function:
- Searches `~/src/` for projects
- Creates/attaches to session named after project directory
- Handles both inside/outside tmux contexts (switch-client vs attach-session)

Similar pattern used in `wt` for worktree sessions and `tmdots` for quick access to this repository.

## Catppuccin Theming

Catppuccin Mocha is the primary theme across all tools:
- **Alacritty**: Multiple variants in `base/.config/alacritty/themes/`, imported in `alacritty.toml`
- **Neovim**: catppuccin.nvim plugin with mocha flavor
- **Git/Delta**: Custom syntax highlighting in git config
- **Bat**: Set via `BAT_THEME` environment variable
- **Tmux**: Custom colors matching Catppuccin palette in statusbar/borders

Theme colors are coordinated but configured separately per tool. Switching themes requires updating multiple tool configs.
