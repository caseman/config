GREEN=$'\033[0;32m'
CYAN=$'\033[0;36m'
RED=$'\033[0;31m'
PURPLE=$'\033[0;35m'
BROWN=$'\033[0;33m'
GRAY=$'\033[38;5;246m'
LT_GRAY=$'\033[0;37m'
LT_BLUE=$'\033[38;5;81m'
LT_GREEN=$'\033[1;32m'
LT_CYAN=$'\033[1;36m'
LT_RED=$'\033[1;31m'
LT_PURPLE=$'\033[1;35m'
YELLOW=$'\033[38;5;178m'
WHITE=$'\033[1;37m'
RESTORE=$'\033[0m' #0m restores to the terminal's default colour

function job_status {
    count=$(jobs -p | wc -l)
    if [[ $count == 0 ]]; then
        echo " "
    else if [[ $count == 1 ]]; then
        echo "🏃"
    else
        echo "🏃🏃"
    fi fi
}

function short_pwd {
    echo -n $PWD | sed -re "s@^$HOME@~@" -re 's|(~?/[^/]*/).*(/.{20,})|\1...\2|'
}

function cmd_status {
    [[ $? != 0 ]] && echo -n "😵"
}
