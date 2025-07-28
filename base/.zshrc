# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages
export LESS="R --use-color -Dd+r -Du+b"

# Path
path+=("$HOME/.cargo/bin" "$HOME/.local/bin")
typeset -U path

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Load all files from $XDG_CONFIG_HOME/zsh/conf.d directory
if [[ -d "$XDG_CONFIG_HOME/zsh/conf.d" ]]; then
  for file in "$XDG_CONFIG_HOME/zsh/conf.d"/*.zsh; do
    [ -r "$file" ] && source "$file"
  done
  unset file
fi


