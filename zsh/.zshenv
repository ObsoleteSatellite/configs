. "$HOME/.cargo/env"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="nvim"
export VISUAL="nvim"

export TMUXIFIER_LAYOUT_PATH=$HOME/.config/tmux

export N_PREFIX=$HOME/.n
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export BUN_INSTALL=$HOME/.bun

export PATH=$BUN_INSTALL/bin:$N_PREFIX/bin:$GOPATH/bin:$GOROOT/bin:$HOME/bin:$HOME/.tmux/plugins/tmuxifier/bin:/usr/local/bin:$PATH

