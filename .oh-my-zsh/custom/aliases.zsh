# Casey's Aliases

alias -g L='| less'
alias -g LL='2>&1 | less'
alias -g G='| grep'
alias -g T='| tee'
alias -g NUL='> /dev/null 2>&1'

alias x='chmod +x'
alias ll='ls -lh'
alias la='ls -AF'
alias ls='ls -F'

alias pd='popd >/dev/null'
alias psg='ps awx | grep'
alias grep='egrep'
alias rgrep='egrep -r'
alias top='top -c'
alias tf='tail -F'
alias goog='google'

alias h='history'
alias zshrc='$EDITOR ~/.zshrc'
alias src='source  ~/.zshrc'
alias aliases='$EDITOR ~/.oh-my-zsh/custom/aliases.zsh'
