# Homebrew configuration
if command -v brew &>/dev/null; then
	# Add Homebrew's completions to FPATH
	FPATH="$(brew --prefix)/share/zsh/site-functions:$(brew --prefix)/share/zsh-completions:$FPATH"
	
	# Add Homebrew bin directories to PATH (if not already there)
	if [[ ":$PATH:" != *:"$(brew --prefix)/bin:"* ]]; then
		export PATH="$(brew --prefix)/bin:$PATH"
	fi
	
	if [[ ":$PATH:" != *:"$(brew --prefix)/sbin:"* ]]; then
		export PATH="$(brew --prefix)/sbin:$PATH"
	fi
fi