# Modern tool replacements with fallbacks

# bat (better cat)
if command -v bat &> /dev/null; then
    alias cat='bat'
    alias catp='bat --plain'  # plain cat when needed
    export BAT_THEME="Catppuccin Mocha"
    export BAT_STYLE="numbers,changes,header"
fi

# eza (better ls)
if command -v eza &> /dev/null; then
    alias ls='eza --color=auto'
    alias ll='eza -la --color=auto --icons'
    alias la='eza -la --color=auto'
    alias lt='eza --tree --color=auto'
    alias l='eza -1AF --color=auto'
else
    # Keep existing ls alias as fallback
    alias l='ls -1AF --color=auto'
fi

# Additional eza aliases when available
if command -v eza &> /dev/null; then
    alias llt='eza -la --tree --color=auto --icons'
    alias lg='eza -la --git --color=auto --icons'
fi