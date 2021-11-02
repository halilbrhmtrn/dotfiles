export EDITOR='vim'
export LESS="-i -R" # case-insensitive less search
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh/history
setopt hist_verify
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt extended_history

# fuzzy find history
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Completion
setopt auto_menu
setopt complete_in_word
setopt always_to_end

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

## enable menu completion
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion::complete:*' use-cache 1

## case-insensitive
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Git completion fix
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'
zstyle ':completion:*:*' ignored-patterns '*pull/*'


lazy_source () {
  eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

bindkey $key[Up]    up-line-or-search
# up-line-or-search:  Open history menu.
# # up-line-or-history: Cycle to previous history line.
#
bindkey $key[Down]  down-line-or-select
# # down-line-or-select:  Open completion menu.
# # down-line-or-history: Cycle to next history line.
#
bindkey $key[Control-Space] list-expand
# # list-expand:      Reveal hidden completions.
# # set-mark-command: Activate text selection.
#
bindkey -M menuselect $key[Return] .accept-line
# # .accept-line: Accept command line.
# # accept-line:  Accept selection and exit menu.
#
# # Uncomment the following lines to disable live history search:
# # zle -A {.,}history-incremental-search-forward
# # zle -A {.,}history-incremental-search-backward


source ~/.zsh/prompt
source ~/.zsh/notifyosd.zsh
source ~/.aliases


# Path stuff
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.bin:$HOME/.local/bin


# Local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /.zsh/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
