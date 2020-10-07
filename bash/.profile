# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include .thinkific if it exists
if [ -f "$HOME/.dotfiles/bash/thinkific" ]; then
    . "$HOME/.dotfiles/bash/thinkific"
fi

# include .helpers if it exists
if [ -f "$HOME/.dotfiles/bash/helpers" ]; then
    . "$HOME/.dotfiles/bash/helpers"
fi

if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi

source $HOME/.rvm/scripts/rvm

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH=$PATH:/home/saviolucena/.local/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export KUBECONFIG=~/.kube/merge.config:~/.kube/config:~/.kube/home

if [ -f "$HOME/bin/starship" ]; then
  eval "$(starship init bash)"
fi
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
export PATH="/home/linuxbrew/.linuxbrew/opt/awscli@1/bin:$PATH"
