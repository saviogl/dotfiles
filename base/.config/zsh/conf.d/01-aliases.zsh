# ZSH Aliases

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..' 

alias l='ls -1AF --color=auto'

alias vim='nvim'
alias v='nvim'

alias reload-zshrc='source ~/.zshrc'

# Git aliases
alias g='git'
alias gl='git log --graph --pretty="format:%C(magenta)%h %C(white) %an %ar%C(blue) %D%n%s%n"'
alias gst='git status --short'
alias gaa='git add --all'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gd='git diff'
alias gco='git checkout'
alias gp='git push'
alias gu='git pull'
alias lg='lazygit'

alias bi="bundle install"

# Tmux
alias t='tmux'
alias ta='tmux attach'
alias tls='tmux list-sessions'
alias tat='tmux attach -t'
alias tproj='(PROJ="$(ls ~/src | fzf)" && cd ~/src/"$PROJ" && tmux attach -t "$PROJ" || tmux new -s "$PROJ")'
alias tdots='(tmux attach -t dots || cd ~/.config/dots && tmux new -s dots)'

# Bundle exec
alias be='bundle exec'

export DOTFILES="~/.config/dots"

alias dots="cd $DOTFILES"
alias src="cd ~/src"
