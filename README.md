# Dotfiles

My personal dotfiles configuration managed with GNU Stow.

## 🎯 Key Features

- **Modern CLI Tools**: bat, eza, ripgrep, delta, fzf, starship, zoxide with
  graceful fallbacks
- **Consistent Theming**: Catppuccin color scheme across all applications
  (Alacritty, Neovim, Git, Wezterm)
- **Modular ZSH**: Clean configuration split into focused modules (aliases,
  completions, tools)
- **Advanced Tmux**: Master-stack layouts, popups for git/GitHub, vim-tmux
  navigation
- **Git Workflow**: Worktree management, extensive aliases, GitHub integration
- **Cross-Platform**: Auto-detects macOS/Linux with platform-specific
  configurations

## 📁 Configuration Structure

### Directory Layout

```
├── base/           # Cross-platform configurations
│   ├── .config/
│   │   ├── zsh/conf.d/      # Modular ZSH configuration
│   │   │   ├── 01-aliases.zsh      # 50+ aliases
│   │   │   ├── 02-starship.zsh     # Prompt setup
│   │   │   ├── 03-completions.zsh  # Enhanced completions
│   │   │   ├── 16-modern-tools.zsh # bat/eza/delta setup
│   │   │   └── ...
│   │   ├── nvim/            # LazyVim configuration
│   │   ├── alacritty/       # Terminal + Catppuccin themes
│   │   ├── git/             # Git + delta configuration
│   │   └── wezterm/         # terminal
│   ├── .local/bin/          # Custom scripts
│   ├── .tmux.conf           # Tmux with 43+ keybindings
│   └── .zshrc               # Main shell config
├── macos/          # macOS-specific configurations
├── linux/          # Linux-specific configurations
└── bin/            # Management scripts
    ├── install     # GNU Stow installer
    ├── clean       # Remove symlinks
    └── bootstrap   # Package installation
```

### Configuration Philosophy

- **Modular Design**: Each tool has focused, single-purpose configuration
- **Platform Detection**: Automatically loads OS-specific settings
- **Graceful Fallbacks**: Works even if modern tools aren't installed
- **XDG Compliance**: Follows XDG Base Directory specification

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

| Option     | Description                                   |
| ---------- | --------------------------------------------- |
| --adopt    | Move existing files into the repository       |
| --simulate | Show what would happen without making changes |

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

## ⚡ Quick Reference

### Shell Aliases

**Navigation & System:**

```bash
# Directory navigation
..          # cd ..
...         # cd ../..
....        # cd ../../..
src         # cd ~/src
dots        # cd ~/.config/dots
c           # clear
fkill       # Interactive process killer with fzf
```

**Git Workflow:**

```bash
# Basic git
g           # git
gst         # git status --short
gaa         # git add --all
gc          # git commit --verbose
gd          # git diff
gp          # git push
gu          # git pull
lg          # lazygit

# Workflow helpers
gwip        # git add -A; git commit -m "WIP"
gunwip      # Undo WIP commit if last commit was WIP
gundo       # git reset --soft HEAD~1
gclean      # git clean -fd
```

**GitHub Integration:**

```bash
# Pull requests
ghpr        # gh pr create
ghprv       # gh pr view
ghd         # gh dash
gb-prreview # List PRs awaiting my review
gb-prpick   # Interactive PR picker

# Repository
ghr         # gh repo view --web
```

**Tmux Sessions:**

```bash
tm          # tmux
tma         # tmux attach
tmproj      # Interactive project session picker
tmdots      # Attach to 'dots' session (or create)
tmc         # New session named after current directory
```

**Git Worktrees:**

```bash
wt <branch>  # Create worktree + tmux session for branch
wtl          # List all worktrees
wtrm         # Remove worktree (interactive picker)
```

### Tmux Keybindings

**Prefix:** `Ctrl-a`

**Session & Windows:**

```bash
C-a s       # Choose session
C-a |       # Split window horizontally
C-a -       # Split window vertically
C-a q       # Kill pane
C-Space     # Next layout (no prefix)
```

**Master-Stack Layout:**

```bash
C-a m       # Create new pane as master
C-a M       # Promote current pane to master
C-a Tab     # Cycle which pane is master
C-a =       # Reset to master-stack layout
```

**Navigation (Vim-style):**

```bash
C-a h/j/k/l # Select pane (or use arrow keys)
C-h/j/k/l   # Smart vim-tmux navigation (no prefix)
Alt-arrows  # Select pane with arrows (no prefix)
```

**Popups:**

```bash
C-a g       # Lazygit popup (90% screen)
C-a G       # GitHub Dashboard popup
C-a M-Enter # Scratch session popup
C-a Enter   # Bottom terminal (15 lines)
```

**Resizing:**

```bash
C-a H/J/K/L # Resize pane (5 units)
```

## 🔧 Tool Configuration

### Neovim (LazyVim)

- **Framework**: LazyVim with custom configuration
- **Key Plugins**: FZF, Yazi file manager, tmux-navigator, Catppuccin theme
- **Custom Keymaps**:
  - `<leader>*` - Grep word under cursor
  - `<leader>sr` - Resume last FZF search
  - `<leader>-` - Open Yazi file manager
- **Theme**: Catppuccin Mocha with consistent colors

### Modern CLI Replacements

- **`cat` → `bat`**: Syntax highlighting with Catppuccin theme, line numbers
- **`ls` → `eza`**: Icons, git status, tree views (`lt`, `llt`)
- **Git pager → `delta`**: Side-by-side diffs, line numbers, syntax highlighting
- **Fallbacks**: Gracefully falls back to standard tools if modern ones aren't
  installed

### Git Configuration

- **Delta pager** with side-by-side view and navigation
- **Diff3 merge style** for better conflict resolution
- **Color moved detection** for refactoring clarity
- **Catppuccin Mocha theme** for consistency

### ZSH Configuration

- **Modular system**: 8 configuration modules in `conf.d/`
- **Starship prompt** with git status and directory info
- **Modern completions** with fzf integration
- **Tool integrations**: Homebrew, rbenv, yazi, fzf, zoxide

## 🎨 Theming

### Catppuccin Color Scheme

Consistent **Catppuccin Mocha** theme across all applications:

- **Alacritty**: Multiple Catppuccin variants available
  (`catppuccin-mocha.toml`, `catppuccin-latte.toml`, etc.)
- **Neovim**: Catppuccin plugin with Mocha variant
- **Git/Delta**: Custom Catppuccin Mocha syntax theme
- **Bat**: Catppuccin Mocha theme for syntax highlighting
- **Wezterm**: Catppuccin Macchiato theme
- **Tmux**: Custom colors matching Catppuccin palette

### Switching Themes

- **Alacritty**: Edit `~/.config/alacritty/alacritty.toml` import line
- **All tools**: Themes automatically coordinate through consistent color
  palette

## ✨ Workflows & Usage

### Daily Development Workflow

**Starting a new project:**

```bash
cd ~/src
wt feature-branch    # Creates worktree + tmux session
# Work in isolated environment with dedicated tmux session
```

**Project navigation:**

```bash
tmproj              # Interactive project picker with fzf
tmdots              # Quick access to dotfiles
src                 # Jump to ~/src directory
```

**GitHub workflow:**

```bash
gb-prreview         # See PRs awaiting your review
gb-prpick           # Interactive PR picker to open in browser
ghd                 # GitHub dashboard (or C-a G in tmux)
ghpr                # Create PR from current branch
```

**File and content discovery:**

```bash
# In Neovim
<leader>*           # Grep word under cursor across project
<leader>sr          # Resume last search
<leader>-           # Open Yazi file manager

# In shell
fkill               # Interactive process management
```

### Git Worktree Management

**Philosophy**: Each feature branch gets its own directory and tmux session,
keeping work completely isolated.

```bash
# Create feature branch environment
wt new-feature      # Creates ../wt-repo--new-feature/ + tmux session

# List and navigate
wtl                 # See all worktrees
tmproj              # Switch between project sessions

# Cleanup when done
wtrm                # Interactive worktree removal
```

### Tmux Power User Features

**Master-stack layout** (DWM-inspired):

- One main pane (master) + stack of smaller panes
- `C-a m` to create new master, `C-a Tab` to cycle focus
- Perfect for code + terminal + logs setup

**Popup-driven workflow**:

- `C-a g` for quick git operations (lazygit)
- `C-a G` for GitHub management (gh-dash)
- `C-a Enter` for quick terminal without losing layout
