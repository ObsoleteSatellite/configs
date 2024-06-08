zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' file-list all
# Initialize completion
autoload -Uz compinit; compinit

# History
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_find_no_dups

setopt PROMPT_SUBST

# Use vi key bindings
bindkey -v
export KEYTIMEOUT=1

# Initialize and load the completion system.
autoload -Uz compinit
compinit


# Custom Prompt
precmd() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        git_info=" %F{green}(${current_branch})%f"
    else
        git_info=""
    fi
}

# %~ is current dir
PROMPT='%F{blue}%~%f${git_info} > '

# AUTO COMPLETE SETTINGS
source ~/.config/local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# SET UP TMUXIFIER
eval "$(tmuxifier init -)"

# ALIASES
alias ll='ls -lah --color'

alias gst='git status'
alias ga='git add'
alias gco='git checkout '

alias zc='nvim $ZDOTDIR/.zshrc'
alias ze='nvim ~/.zshenv'

alias nc='nvim ~/.config/nvim/init.lua'

alias sc='nvim ~/.ssh/config'

alias vim='nvim'

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
