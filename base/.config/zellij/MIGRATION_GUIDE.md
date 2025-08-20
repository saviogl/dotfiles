# Tmux to Zellij Migration Guide

This guide explains the differences between your tmux configuration and the new Zellij setup, helping you understand the modern improvements and workflow changes.

## Key Conceptual Differences

### Sessions vs Workspaces
- **Tmux**: Sessions contain windows, windows contain panes
- **Zellij**: Sessions contain tabs, tabs contain panes (more intuitive naming)

### Configuration Language
- **Tmux**: Custom configuration syntax
- **Zellij**: KDL (Knowledge Definition Language) - more structured and readable

### Default Behavior
- **Tmux**: All keybindings active by default (can conflict with applications)
- **Zellij**: Uses "locked" mode by default to prevent conflicts with vim/nvim

## Feature Comparison

| Feature | Tmux Config | Zellij Config | Notes |
|---------|-------------|---------------|-------|
| **Prefix Key** | `C-a` | `C-a` (tmux mode) | Same muscle memory |
| **Mouse Support** | `set -g mouse on` | `mouse_mode true` | Enhanced mouse support |
| **Clipboard** | `set -g set-clipboard on` | `copy_clipboard "system"` | Better system integration |
| **Base Index** | `set -g base-index 1` | `pane_base_index 1` | Same behavior |
| **Pane Navigation** | `bind hjkl select-pane` | `bind hjkl MoveFocus` | Same vim-like navigation |
| **Window Splitting** | `bind \| split-window -h` | `bind \| NewPane "Right"` | Same visual memory |
| **Alt Navigation** | `bind -n M-Arrow` | `bind "Alt hjkl"` | More vim-like |
| **Resizing** | `bind HJKL resize-pane` | `bind HJKL Resize` | Same concept |
| **Session Selector** | `bind s choose-session` | Session mode + plugins | Enhanced UI |
| **Config Reload** | `bind r source-file` | `bind r reload-config` | Modern approach |

## Workflow Improvements

### 1. No More Keybinding Conflicts
**Problem with tmux**: Keybindings would interfere with vim/nvim
```bash
# Tmux: Ctrl+o conflicts with vim's jump forward
```

**Zellij solution**: Locked mode by default
```kdl
// Normal mode is "locked" - no conflicts with applications
normal clear-defaults=true {
    bind "Ctrl a" { SwitchToMode "tmux"; }  // Only prefix activates
}
```

### 2. Enhanced Floating Panes (vs Tmux Popups)
**Tmux popups**:
```bash
bind g display-popup -w 90% -h 90% -d '#{pane_current_path}' -E "lazygit"
bind N display-popup -w 85% -h 85% -E "note"
```

**Zellij floating panes**:
```kdl
bind "g" { 
    LaunchOrFocusPlugin "lazygit" { floating true }
}
bind "N" {
    LaunchOrFocusPlugin "notes" { floating true }
}
```
- Better integration with workspace
- Persistent across sessions
- More flexible positioning

### 3. Modern Session Management
**Tmux**: Basic session switcher
**Zellij**: Rich session manager plugin with visual interface

### 4. Layout System
**Tmux**: Manual pane creation
**Zellij**: Predefined layouts that can be applied instantly
```kdl
// Equivalent to your tmux main-vertical + bottom terminal
bind "Enter" { NewPane "Down"; }        // Bottom terminal
bind "S-Enter" { NewPane "Right"; }     // Side pane
```

## Key Keybinding Changes

### Activation (Same Muscle Memory)
| Action | Tmux | Zellij |
|--------|------|--------|
| Enter command mode | `C-a` | `C-a` |
| Send literal prefix | `C-a C-a` | `C-a C-a` |

### Navigation (Enhanced)
| Action | Tmux | Zellij | Improvement |
|--------|------|--------|-------------|
| Move between panes | `C-a hjkl` | `C-a hjkl` | Same |
| Alt navigation | `M-Arrow` | `Alt hjkl` | More vim-like |
| Resize panes | `C-a HJKL` | `C-a HJKL` | Same |

### Window/Tab Management
| Action | Tmux | Zellij |
|--------|------|--------|
| New window/tab | `C-a c` | `C-a c` |
| Close window/tab | `C-a x` | `C-a x` |
| Next window/tab | `C-a n` | `C-a n` |
| Previous window/tab | `C-a p` | `C-a p` |

### Splitting (Same Visual Memory)
| Action | Tmux | Zellij |
|--------|------|--------|
| Horizontal split | `C-a \|` | `C-a \|` |
| Vertical split | `C-a -` | `C-a -` |
| Close pane | `C-a q` | `C-a q` |

### Enhanced Features
| Action | Tmux | Zellij | Enhancement |
|--------|------|--------|-------------|
| Floating toggle | N/A | `C-a f` | New feature |
| Layout cycle | N/A | `C-a Space` | Quick layouts |
| Search in scrollback | Copy mode | `C-a [` | Better search UI |

## Modern Improvements

### 1. Better Plugin System
- Tmux: Limited plugin support
- Zellij: Rich plugin ecosystem with WebAssembly

### 2. Themes and Styling
- Tmux: Manual color configuration
- Zellij: Theme system with predefined themes

### 3. Session Persistence
- Tmux: Manual with tmux-resurrect
- Zellij: Built-in session serialization

### 4. Better Copy Mode
- Tmux: Vi-mode copy with manual configuration
- Zellij: Modern search and copy interface

## Migration Tips

### 1. Start Gradually
Begin with the basic configuration and add features as needed:
```bash
# Start a simple session
zellij

# Try the development layout
zellij --layout development
```

### 2. Muscle Memory Preservation
The prefix key (`C-a`) and main navigation (`hjkl`) remain the same, so your existing muscle memory will work immediately.

### 3. Explore New Features
Once comfortable with basics, explore:
- Floating panes: `C-a f`
- Layout switching: `C-a Space`
- Session manager: `C-a s`

### 4. Customize Gradually
The configuration is modular - you can modify individual keybindings or modes without breaking the entire setup.

## Common Migration Questions

### Q: Can I use the exact same keybindings as tmux?
A: Yes, but Zellij's locked mode approach is recommended to avoid conflicts with vim/nvim.

### Q: What about my tmux plugins?
A: Most functionality is built into Zellij or available as plugins. Check the plugin ecosystem for equivalents.

### Q: How do I handle the different session model?
A: Zellij sessions are more persistent and can be serialized/restored automatically.

### Q: Is the performance different?
A: Zellij is written in Rust and generally performs better than tmux, especially with many panes.

## Quick Start Commands

```bash
# Start with default layout
zellij

# Start with development layout
zellij --layout development

# Attach to existing session
zellij attach session-name

# List all sessions
zellij list-sessions

# Kill a session
zellij kill-session session-name
```

## Configuration Locations

- **Config**: `~/.config/zellij/config.kdl`
- **Layouts**: `~/.config/zellij/layouts/`
- **Themes**: `~/.config/zellij/themes/` (optional)
- **Plugins**: `~/.config/zellij/plugins/` (optional)

This migration preserves your workflow while providing modern improvements and better application integration.