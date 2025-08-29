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

# Git workflow helpers
alias gwip='git add -A; git commit -m "WIP"'
alias gunwip='git log -1 --oneline | grep -q "WIP" && git reset HEAD~1'
alias gclean='git clean -fd'
alias gundo='git reset --soft HEAD~1'

# GitHub CLI aliases
alias ghpr='gh pr create'
alias ghprl='gh pr list'
alias ghprv='gh pr view'
alias ghprc='gh pr checkout'
alias ghprs='gh pr status'
alias ghprm='gh pr merge'

# GitHub repo and workflow aliases  
alias ghr='gh repo view --web'

alias reload='source ~/.zshrc'

# Git worktree management
wt() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: wt <branch-name>"
    return 1
  fi
  
  local branch="$1"
  local repo_name=$(basename $(git rev-parse --show-toplevel))
  local wt_dir="../wt-${repo_name}--${branch}"
  local session_name="wt-${repo_name}--${branch}"
  
  # Create worktree
  git worktree add "$wt_dir" "$branch" 2>/dev/null || git worktree add -b "$branch" "$wt_dir"
  
  # Create and switch to tmux session
  cd "$wt_dir" && tmux new-session -d -s "$session_name" && cd -
  
  # Switch to the session based on whether we're in tmux or not
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$session_name"
  else
    tmux attach-session -t "$session_name"
  fi
  
  echo "✅ Created worktree and tmux session: $session_name"
}

# List all worktrees
wtl() {
  git worktree list
}

# Remove worktree and switch back to main
wtrm() {
  local selected_worktree
  selected_worktree=$(git worktree list | tail -n +2 | fzf --preview 'echo {}' | awk '{print $1}')
  
  if [[ -z "$selected_worktree" ]]; then
    echo "No worktree selected"
    return 1
  fi
  
  # Extract branch name from the worktree path
  local branch=$(basename "$selected_worktree" | sed 's/.*--//')
  local repo_name=$(basename $(git rev-parse --show-toplevel 2>/dev/null) 2>/dev/null)
  local session_name="wt-${repo_name}--${branch}"
  
  # Switch to main worktree first
  local main_dir=$(git worktree list | head -1 | awk '{print $1}')
  cd "$main_dir"
  
  # Remove the tmux session if it exists
  if tmux has-session -t "$session_name" 2>/dev/null; then
    # If we're currently in the session we want to kill, switch to first available session
    if [[ -n "$TMUX" ]] && [[ "$(tmux display-message -p '#S')" == "$session_name" ]]; then
      local first_session=$(tmux list-sessions -F '#{session_name}' | grep -v "^$session_name$" | head -1)
      if [[ -n "$first_session" ]]; then
        tmux switch-client -t "$first_session"
      else
        tmux detach-client
      fi
    fi
    tmux kill-session -t "$session_name"
  fi
  
  # Remove the worktree
  git worktree remove "$selected_worktree"
  echo "✅ Removed worktree and tmux session: $session_name"
}

# GitHub issues
alias ghi='gh issue create'
alias ghil='gh issue list'
alias ghiv='gh issue view'
alias ghis='gh issue status'

# Quick PR workflow aliases
alias propen='gh pr view --web'
alias prdiff='gh pr diff'
alias prcheck='gh pr checks'
alias prready='gh pr ready'
alias prdraft='gh pr ready --undo'

# PR review aliases
alias gb-prreview='gh pr list --search "user-review-requested:@me" --state open --json number,title,author,headRepositoryOwner,headRepository,url --template "{{range .}}{{tablerow (printf \"#%v\" .number) .title .author.login (printf \"%s/%s\" .headRepositoryOwner.login .headRepository.name) .url}}{{end}}"'
alias gb-prstatus='gh pr status'
alias gb-prpick='gb-prreview | fzf --ansi --header "Select PR to open" --no-preview | awk "{print \$1}" | sed "s/#//" | xargs -I {} gh pr view {} --web'

alias bi="bundle install"

# Tmux
alias tm='tmux'
alias tma='tmux attach'
alias tmls='tmux list-sessions'
alias tmat='tmux attach -t'
alias tmproj='(PROJ="$(ls ~/src | fzf)" && cd ~/src/"$PROJ" && tmux attach -t "$PROJ" || tmux new -s "$PROJ")'
alias tmdots='(tmux attach -t dots || cd ~/.config/dots && tmux new -s dots)'
alias tmc='tmux new -s "${PWD##*/}"'

# Bundle exec
alias be='bundle exec'

export DOTFILES="~/.config/dots"

alias dots="cd $DOTFILES"
alias src="cd ~/src"
