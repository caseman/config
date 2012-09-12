unset noclobber


set autologout=
setopt NO_BEEP
setopt AUTO_PUSHD
setopt CHASE_LINKS
setopt LIST_TYPES

#         skip remaining setup if not an interactive shell
if [[ ${prompt:-noninteractive} = "noninteractive" ]]; then
	exit
fi

#         general terminal characteristics
stty erase '^?' intr '^C' -istrip min 1

#          settings  for interactive shells

# Set vi bindings
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

bindkey -v
bindkey ^W backward-delete-word
bindkey ^P up-line-or-history
bindkey ^N down-line-or-history
bindkey ^f vi-find-next-char
bindkey ^F vi-find-prev-char
bindkey ^g vi-repeat-find
bindkey ^b  vi-beginning-of-line
bindkey ^e  vi-end-of-line
bindkey ^r  history-incremental-search-backward
bindkey '[1~' vi-beginning-of-line   # Home
bindkey '[4~' vi-end-of-line         # End of Line 
bindkey '[3~' delete-char            # Del
bindkey '[5~' backward-word # Page Up
bindkey '[6~' forward-word  # Page Down

# history nav
bindkey -M viins "^N" up-line-or-search
bindkey -M viins "^P" down-line-or-search
bindkey -M viins "^[[A" up-line-or-search
bindkey -M viins "^[[B" down-line-or-search

#set ignoreeof=1

type uname > /dev/null 2>&1
#if [ $? = 0 -a $TERM != screen ]; then
		echo -n "]2;`uname -n` -- `uname -rs`"
#fi

# History
setopt NO_HIST_BEEP
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
alias h='history'

# git prompt functions
source ~/.zsh/git-prompt/git.zsh

# Prompt
if [ $USER != casey -a $USER != caseman ]; then
	PROMPT="%n@%m%# "
else
	PROMPT="%m%# "
fi
RPROMPT=" %~"

# Set window title and tab to user@hostname:dir
if [ $USER != casey ]; then
    precmd () {
         print -Pn "\033]1;%n@%m:%~%(?..(%?%))\033]2;%n@%m:%~ %(?..(%?%)) $__CURRENT_GIT_STATUS[1]"
    }
else
    precmd () {
         print -Pn "\033]1;%m:%~%(?..(%?%))\033]2;%m:%~ %(?..(%?%)) $__CURRENT_GIT_STATUS[1]"
    }
fi
export EDITOR=vim
export VISUAL=vim
export CVS_RSH=ssh
export PATH=$HOME/bin:$HOME/opt/bin:$PATH

alias -g L='| less'
alias -g G='| grep'
alias -g T='| tee'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias x='chmod +x'
alias ll='ls -lh'
alias la='ls -AF'
alias ls='ls -F'
alias su='su -m'
alias nc='nclient -noask'
alias pd='popd'
alias ssh='ssh -2 -A'
alias scp='scp -2 -c blowfish'
alias tags='exctags -R --exclude="test*" --exclude="*-head"'
alias vi=vim
alias psg='ps awx | grep'
alias notes='$EDITOR `date "+%Y-%m-%d-notes"`'
alias jnl='$EDITOR `date "+%Y-%m-%d"`'
alias less='less -n -x4'
alias grep='egrep -n'
alias rgrep='egrep -rn'
alias top='top -c'
alias pg='sudo -u postgres'
alias setvm='export VM_ROOT="$PWD"; eval `grep VM_HOSTNAME .vm_config`'
alias sync='p4 sync && p4 resolve -as'
alias resolve='p4 resolve -as'
alias sbv="sync && build && vm sync"
alias tf='tail -F'
alias iostat='iostat -k'
alias pgstat='pg psql postgres -c "select * from pg_stat_activity"'
alias p4d='p4 diff -du ...'
alias p4d='p4 diff -du ...'
alias p4r='p4 resolve ...'
alias p4s='p4 submit ...'
tfs() {tail -F $* | sed 's/^.*> //'}
s() {
	if [ "$#" -eq "0" ]; then
		screen -RR -S "$LOGNAME.`date +"%Y.%m.%d.%H.%M"`"
	else
		screen $*
	fi
}
alias sls='screen -ls'
bs() {
	build $* && vm sync
}
alias get='sudo apt-get -y install'

# complete hostnames out of ssh's ~/.ssh/known_hosts
autoload -U compinit; compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' users resolve
hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*})
zstyle ':completion:*:hosts' hosts $hosts

# completion debugging
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

if [ -f ~/.Xauthority ]; then
	chmod g+r ~/.Xauthority
fi

# Put last to avoid confusing the interpreter above
setopt EXTENDED_GLOB

# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
for func in $^fpath/*(N-.x:t); autoload $func

# Execute local config if any
# so that .zshrc can remain the same on all systems
if [ -f ~/.localrc ]; then
    . ~/.localrc
fi
