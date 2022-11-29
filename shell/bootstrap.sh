# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.dotfiles/bin"
path_prepend "$HOME/.vim/plugged/fzf/bin"
path_prepend "$HOME/.krew/bin"
path_prepend "$HOME/go/bin"
path_prepend "/opt/homebrew/opt/libpq/bin"
path_prepend "/opt/homebrew/opt/python@3.10/libexec/bin" # Python Alias Path - This might change with Brew python installation information
