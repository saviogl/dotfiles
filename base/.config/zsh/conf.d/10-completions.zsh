# ZSH Completions configuration

# Setup completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion based on LS_COLORS
zstyle ':completion:*' verbose yes

# Initialize the completion system
autoload -Uz compinit
compinit

# Use cache for completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache" 