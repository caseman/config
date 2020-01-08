# Minimal zsh config for fast startup in embedded usage

export MINIMAL_ZSH=1

autoload -U add-zsh-hook

# Cherry pick some prezto plugins
source ~/.zprezto/modules/git/alias.zsh
source ~/.zprezto/modules/directory/init.zsh
source ~/.zprezto/modules/history/init.zsh

# Minimal, but sensible vim as an external editor
export EDITOR='vim -u ~/.minimal-vimrc'
export VISUAL="$EDITOR"

# Still allow some emacs movment bindings and reverse inc search
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
bindkey '^r' history-incremental-search-backward
# vim (not vi) delete behavior
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word 
bindkey '^U' backward-kill-line
# ESC in command mode opens editor
bindkey -M vicmd '^[' edit-command-line
# Disable conflicting self-insert mode
bindkey -rM viins '^X'

# vim keybindings with cursor to indicate edit mode
function zle-keymap-select zle-line-init
{
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}
function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
bindkey -v

bindkey '^q' push-line-or-edit

# Load custom prompt
source ~/.zsh/prompt.zsh

# Load universal aliases
if [[ -f ~/.aliases ]]; then
    . ~/.aliases
fi

# Execute local config if any
# so that .zshrc can remain the same on all systems
if [[ -f ~/.localrc ]]; then
    . ~/.localrc
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

# Remove annoying delay switching to vi command mode using ESC
export KEYTIMEOUT=1
