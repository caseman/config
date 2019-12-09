# Casey's custom prompt with async git updates

autoload -U add-zsh-hook
setopt PROMPT_SUBST

_git_prompt_file=$(mktemp "${TMPDIR:-/tmp}/prompt-git-async-XXXXXXXXXX")
git_prompt_status() {
    [[ ! -a $_git_prompt_file ]] && echo >! $_git_prompt_file
    cat $_git_prompt_file
}

# Running man icon for bkgnd jobs
PROMPT='%2(j.🏃.)%1(j.🏃 .)'
# Git status
PROMPT+='$(git_prompt_status)'
# Change symbol color depending on last command success
PROMPT+='%(?.%F{82}.%F{red})%(!.#.)'
# Reset colors
PROMPT+='%f%k '
# PWD limited to 64 chars
RPROMPT='%F{236}%K{236}%F{222}%64<..<%(5~|%-2~/…/%3~|%4~)%f%k'

# Bkgnd git status update
update_prompt_status() {
    update_git_prompt
}
add-zsh-hook precmd update_prompt_status

# Ensure prompt status is cleared when we change cwd
reset_prompt_status() {
    echo >! $_git_prompt_file
}
add-zsh-hook chpwd reset_prompt_status

# Reset git prompt status if a git command is invoked that can affect it
check_for_git_cmd() {
    [[ ${2:0:3} == "git" && \
       ${2:0:10} != "git status" && \
       ${2:0:7} != "git log" && \
       ${2:0:8} != "git diff" && \
       ${2:0:8} != "git grep" && \
       ${2:0:9} != "git blame" ]] && reset_prompt_status
}
add-zsh-hook preexec check_for_git_cmd

# cleanup on exit
cleanup_prompt_status() {
    rm -f $_git_prompt_file
}
add-zsh-hook zshexit cleanup_prompt_status

update_git_prompt() {
    local git_prompt branch status stashes ahead behind
    git_prompt=''
    prompt_end=''
    last_status=$(git_prompt_status)
    if branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
        gstatus=$(git status --porcelain --ignore-submodules=dirty 2>/dev/null)
        stashes=$(git stash list 2>/dev/null | wc -l | tr -d '[:space:]')
        ahead=$(git rev-list "${branch_name}"@{upstream}..HEAD 2>/dev/null | wc -l | tr -d '[:space:]')
        behind=$(git rev-list HEAD.."${branch_name}"@{upstream} 2>/dev/null | wc -l | tr -d '[:space:]')
        dead=$(git branch -vv 2>/dev/null | \grep -E ': gone]' --count)

        if [[ -n $gstatus ]]; then
            git_prompt+='%F{black}%K{yellow}'
            status_for() {
                count=$(echo "$gstatus" | \grep -E "^$1" --count)
                [[ "$count" != "0" ]] && echo "${count}${2} "
            }
            git_prompt+="⋲ ${branch_name}❲$(status_for '.?A' 'a')$(status_for 'M.' 's')$(status_for '.M' 'm')$(status_for 'D' 'd')$(status_for 'R' 'r')$(status_for '\?\?' '?')"
            # Trim trailing space and cap
            git_prompt="$(echo $git_prompt | xargs echo)❳"
            prompt_end="%F{yellow}%K{black}"
        else
            git_prompt+='%F{83}'
            git_prompt+="⋲ $branch_name"
        fi
        [[ "$stashes" != "0" ]] && git_prompt+=" *"
        [[ "$ahead" != "0" ]] && git_prompt+=" ${ahead}↑"
        [[ "$behind" != "0" ]] && git_prompt+=" ${behind}↓"
        [[ "$dead" != "0" ]] && git_prompt+=" ${dead}⚰︎"
        git_prompt+="${prompt_end}%f%k"
    fi
    if [[ $git_prompt != $last_status ]]; then
        echo "$git_prompt" >! $_git_prompt_file
		zle && zle reset-prompt
    fi
}

# Ensure the prompt is updated
TMOUT=5
TRAPALRM() { zle reset-prompt }

