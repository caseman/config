export XDG_CONFIG_HOME=/home/casey/.config/

set -o vi

# Enable bash completion
if [[ -z $BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# shell options (see https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html)
shopt -s histappend # keep old history
shopt -s histverify # allow editing of history substitutions
shopt -s progcomp_alias # expand aliases

source ~/.aliases

if [ -z $HOME_BIN ]; then
    export HOME_BIN="$PWD/bin"
    export PATH="$HOME_BIN:$PATH"
fi

if [ -z $OPAM_LAST_ENV ]; then
    eval $(opam env --switch=default)
fi
alias switch='eval $(opam env --set-switch)'


if [ -z $KEYCHAIN_STARTED ]; then
    eval $(keychain --eval  ~/.ssh/id_!(*.pub))
    export KEYCHAIN_STARTED=1
fi

GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWDIRTYSTATE=1
source ~/.bash/git-prompt.sh
source ~/.bash/prompt.sh
export PS1='$(__git_ps1 "${GRAY}┠╴%s ")${LT_BLUE}$(short_pwd)${RESTORE}$(job_status)${YELLOW}\$ ${RESTORE}'
