# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Minimal, but sensible vim as an external editor
export EDITOR='vim -u ~/.minimal-vimrc'
alias vim-minimal="$EDITOR"
export VISUAL="$EDITOR"
export PSQL_EDITOR="vim -u ~/.vim/scripts/psql.vim"

# use zargs
autoload -U zargs

# Load custom prompt
source ~/.zsh/prompt.zsh

DEFAULT_USER="caseyduncan"

# Still allow some emacs movment bindings and reverse inc search
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
bindkey '^r' history-incremental-search-backward
# ESC in command mode opens editor
bindkey -M vicmd '^[' edit-command-line
# Disable conflicting self-insert mode
bindkey -rM viins '^X'

# Load universal aliases
if [[ -f ~/.aliases ]]; then
    . ~/.aliases
fi

# Execute local configs if any
# so that .zshrc can remain the same on all systems
if [[ -f ~/.localrc ]]; then
    . ~/.localrc
fi
if [[ -f ~/.privaterc ]]; then
    . ~/.privaterc
fi

# Non-annoying alias expansion
typeset -a ealiases
# Never expand these commands
noexpand="\
ls
cd
cp
mv
ln
rm"
# commands above, "nocorrect" and "noglob" aliases are not expanded
ealiases=($(alias | sed -e "/'nocorrect /d" -e "/'noglob /d" \
    -e 's/=.*//' -e "$(echo $noexpand | sed -e 's:.*:/^&$/d:')"))
echo $eaaliases

_expand-ealias() {
    # Only expand aliases explicitly listed, except ALL CAPS (global) aliases
    if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" && \
        ! $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N _expand-ealias

bindkey ' '    _expand-ealias
bindkey '^ '   magic-space          # control-space to bypass expansion
bindkey -M isearch " "  magic-space # normal space during searches

# Enable text-object movements
autoload -U select-bracketed
autoload -U select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in visual viopp; do
    bindkey -M $km -- '-' vi-up-line-or-history
    for c in {a,i}${(s..)^:-\'\"\`\|,./:;-=+@}; do
        bindkey -M $km $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done

# Callback for vim mode change
function zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        # Set block cursor
        echo -ne '\e[1 q'
    else
        # Set beam cursor
        echo -ne '\e[5 q'
    fi
}

# Bind the callback
zle -N zle-keymap-select

# Remove annoying delay switching to vi command mode using ESC
export KEYTIMEOUT=1
