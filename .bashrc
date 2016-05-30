# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# User specific aliases and functions
alias la="ls -la"
alias ..="cd .."
TERM=xterm-256color
source /Xilinx/env-12.2.sh
source ~/TP/2A/3D/practical1/gcc493.sh
PATH=$PATH:/opt/mips-tools-cep/bin
PATH=$PATH:/matieres/4MMPGL/GL/global/bin
PATH=$PATH:~/TP/2A/GL/Projet_GL/src/main/bin
PATH=$PATH:~/TP/2A/GL/Projet_GL/src/main/bin
PATH=$PATH:~/TP/2A/GL/Projet_GL/src/test/script/launchers
PATH=$PATH:~/TP/2A/GL/Projet_GL/src/test/script
export PATH
alias ccat='pygmentize -g'
alias RND6='GET "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"'
alias RND='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'
alias emacs='echo "EMACS SUCKS" && sleep 1 && vim'
alias KA='ps -ax|grep'
alias RNDO='find -type f|shuf|head -n 1|xargs -d "\n" xdg-open&'
alias douille='ddd'
alias RND6='GET "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"'
alias RNDB='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'
alias PR='PROMPT_COMMAND="echo -en " && echo Success'
alias PRE='PROMPT_COMMAND="prompt_command" && echo End'
alias LL='ls -alF'  #'list long'
alias LA='ls -A'    #'list all'
alias L='ls -CF'    #'list'
alias LCR='ls -cr'  #'list changed recently'
alias LC='ls -c'    #'list changed'
alias CD='cd; clear'
alias CL='cd; clear'
alias ..='cd ..'
alias ++="pushd .. > /dev/null"
alias ,,="popd > /dev/null"
alias ii="cd -"
alias git='LANG=en_US git'
alias dirs="dirs -v"

alias RM='git rm'
alias ADD='git add'
alias LOL='git lol'
alias PUSH='git push'
alias PULL='git pull'
alias INIT='git init'
alias GRET='git grep'
alias DIFF='git diff'
alias STASH='git stash'
alias FETCH='git fetch'
alias MERGE='git merge'
alias COUNT='git count'
alias CLONE='git clone'
alias REBASE='git rebase'
alias COMMIT='git commit -m'
alias BRANCH='git branch'
alias STATUS='git status'
alias CHECKOUT='git checkout'
alias GITRESET='git fetch --all; git reset --hard origin/master'

alias MAKE="for i in {1..25}; do echo; done; make -j 4"
alias MAKE2="for i in {1..25}; do echo; done; make -j 4 clean && make -j 4"
function MKCD { mkdir -p "$1" && cd "$1" || exit; }
function CCAT { grep --color=always -rnC3 -- "$@" . | less -R; }
function QUIET { ( "$@" &> /dev/null & ); }
function LQ { nohup "$@"&exit; }
function cd { builtin cd "${@}" && ls; }
shopt -s autocd
clear
man() {
    env \
        LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
        LESS_TERMCAP_md="$(printf "\e[1;31m")" \
        LESS_TERMCAP_me="$(printf "\e[0m")" \
        LESS_TERMCAP_se="$(printf "\e[0m")" \
        LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
        LESS_TERMCAP_ue="$(printf "\e[0m")" \
        LESS_TERMCAP_us="$(printf "\e[1;32m")" \
        man "$@"
}

function _show_git_status() {
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [[ -n "$branch" ]]; then
        git_status=$(git status 2> /dev/null)
        color='38;5;20'
        if [[ $git_status =~ 'Untracked files' ]]; then
                color='38;5;76'
                branch="${branch}?"
        fi
        if git stash show &>/dev/null; then
                color='38;5;76'
                branch="${branch}+"
        fi
        if [[ $git_status =~ 'working directory clean' ]]; then
                color=$'38;5;82'
        fi
        if [[ $git_status =~ 'Your branch is ahead' ]]; then
                color='38;5;226'
                branch="${branch}>"
        fi
        if [[ $git_status =~ 'Your branch is behind' ]]; then
                color='38;5;142'
                branch="${branch}<"
        fi
        if [[ $git_status =~ 'Changes to be committed' ]]; then
                color='38;5;214'
        fi
        if [[ $git_status =~ 'Changed but not updated' ||
                $git_status =~ 'Changes not staged'      ||
                $git_status =~ 'Unmerged paths' ]]; then
        color='38;5;202'
fi
if [[ $git_status =~ 'Your branch'.+diverged ]]; then
        color=$'38;5;196'
        branch="${branch}!"
fi
echo -ne " [\033[${color}m${branch}\033[0m]"
    fi
    return 0
}

function prompt_command {
	local tmp=$?
	local pyellow="\[\e[1m\033[38;5;202m\]"; bold=$'\e[1m'; normal=$'\e[0m'; lightred=$'\e[91m'; lightgreen=$'\e[92m';
	if [ $tmp -ne "0" ]
	then
		local errortest=" $bold$lightred✘ "
	else
		local errortest=" $bold$lightgreen✔ "
	fi

	if [ "$UID" != "0" ]; then
		local SYMBOL="$"
		local UNAME_COLOR="\[\033[1;35m\]"
		local FINAL_COLOR="\[\033[0m\]"
	else
		local SYMBOL="#"
		local UNAME_COLOR="\[\033[1;34m\]"
		local FINAL_COLOR="\[\033[0;32m\]"
	fi

	git_status=$(_show_git_status)

	export PS1="\e[0;32m\h $pyellow\W\e[0m\$git_status$normal$errortest$normal$UNAME_COLOR$SYMBOL$FINAL_COLOR "
}

PROMPT_COMMAND="prompt_command"
