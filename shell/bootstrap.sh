path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.dotfiles/bin"
path_prepend "$HOME/.vim/plugged/fzf/bin"
path_prepend "$HOME/.krew/bin"
path_prepend "/opt/homebrew/opt/libpq/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
