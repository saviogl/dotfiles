# Functions
source ~/.shell/functions.sh

# Thinkific
source ~/.shell/thinkific.sh

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
