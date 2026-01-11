export XDG_CONFIG_HOME=/home/casey/.config/

if [ -z $HOME_BIN ]; then
    export HOME_BIN="$PWD/bin"
    export PATH="$HOME_BIN:$PATH"
fi

alias v=nvim
alias g=git
alias cd="pushd >/dev/null"
alias pd=popd
function install {
    sudo apt-get -y install $@ && nvim "+:norm Goget $@" ~/gh/config/ubuntu-setup.sh
}
alias setup="nvim ~/gh/config/ubuntu-setup.sh"
alias bat=batcat
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "....."="cd ../../../.."
alias vrc="nvim ~/.bashrc && source ~/.bashrc"
alias hi="echo hi"
alias vspec="~/.local/share/nvim/plugged/vim-vspec/bin/vspec"
function colors {
    for colour in {1..255};     do echo -en "\033[38;5;${colour}m38;5;${colour} \n"; done | column -x
}

if [ -z $OPAM_LAST_ENV ]; then
    eval $(opam env --switch=default)
fi
alias switch='eval $(opam env --set-switch)'

# Git
git-branch-fzf() {
    git --no-pager branch -vv --sort='-committerdate:iso8601' \
    | fzf +m --preview="git --no-pager log --abbrev-commit -5 {1} | bat --color always --plain" \
    | awk '{print $1}'
}
git-stash-fzf() {
	git --no-pager stash list | sed 's/: / /' \
    | fzf +m --preview-window='top:75%' \
    	     --preview='git stash show {1} && echo "---" && git --no-pager stash show --color=always -p {1}' \
    | cut -f1 -d ' '
}
git-status-fzf() {
    git --no-pager status -s | fzf -m --preview='git diff {2}' | awk '{print $2}'
}
git-log-fzf() {
    git --no-pager log --oneline \
    | fzf +m --preview-window='top:75%' --preview='git show --color=always {1}' | awk '{print $1}'
}

alias gco='git checkout'
alias gc='git commit -m '
alias gac='git add --all && git commit'
alias g+='git add'
alias gp='git push'
alias gbr='git-branch-fzf | xargs git checkout'
alias gpsup='git push --set-upstream origin $(git-branch-current)'
alias gdob='git diff origin/$(git-branch-current)...$(git-branch-current)'
alias gcm='git checkout master'
alias gst='git status'
alias gss='git status -s'
alias gls='git ls-files -dmo'
alias gstatus='git-status-fzf | xargs git'
alias gstash='git-stash-fzf | xargs git stash'
alias glog='git-log-fzf | xargs git'

if [ -z $KEYCHAIN_STARTED ]; then
    eval $(keychain --eval  ~/.ssh/id_!(*.pub))
    export KEYCHAIN_STARTED=1
fi

GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWDIRTYSTATE=1
source ~/.bash/git-prompt.sh
source ~/.bash/prompt.sh
export PS1='${LT_BLUE}$(printf "%${COLUMNS}s\r" $(short_pwd))${RESTORE}$(__git_ps1 "${GRAY}┠╴%s ")$(job_status)${YELLOW}\$ ${RESTORE}'
