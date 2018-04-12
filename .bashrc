#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# .bashrc

CDPATH=:..:~:~/Downloads
PAGER=less
export PAGER
#set -o vi
set -o notify
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkjobs
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s extquote
shopt -s histappend
shopt -s nocaseglob

TERM=xterm-256color

# Misc tools
alias ccat='pygmentize -g'
alias KA='ps -ax|grep'
alias dirs='dirs -v'
alias gitk='gitk --all'
# alias RES='cp ~/.mozilla/firefox/gph8zx27.default/jetpack/jid1-xUfzOsOFlzSOXg@jetpack/simple-storage/store.json /run/media/mmeloux/Documents/Documents/Archive\ documents/res_settings.json'
alias MP4='for f in *.mp4; do ffmpeg -i "$f" -vn -c:a libmp3lame -ar 44100 -ac 2 -ab 192k "${f/%mp4/mp3}"; done'
alias KEY='cat /usr/share/X11/xkb/rules/xorg.lst'
alias emacs='vim'
alias WATCH='tail -fs 0.2 -n $LINES'
alias GITL='git log --oneline | nl -v0 | sed "s/^ \+/&HEAD~/"'
alias SWAP='sudo swapoff /dev/sda7 && sudo swapon /dev/sda7'
alias YT='youtube-dl --extract-audio --audio-format mp3'
alias PAC='pacman -Qtdq > /dev/null && sudo pacman -Rns $(pacman -Qtdq | sed -e '\'':a;N;0ba;s/\n/ /g'\'')'

# Randomness
alias RND='find -type f|shuf|head -n 1|xargs -d "\n" xdg-open&'
alias RND6='GET "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"'
alias RNDB='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'
alias RND='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'

# Meta
alias VIM='vim ~/.bashrc'
alias SRC='source ~/.bashrc'

# Programming
alias IJ='sh ~/idea-IC-135.1289/bin/idea.sh &'
alias FW='cd ~/workspace/Fire\ Watcher && nohup gedit utilities.js main.js io.js data.js index.html bootstrap-update.css >&/dev/null &'
alias CMS='cd ~/workspace/Color\ Madness/bin && nohup gedit server.js tools.js >&/dev/null &'
alias CMH='cd ~/workspace/Color\ Madness/bin && nohup gedit ../js2/main.js ../js2/events.js ../js2/draw.js ../js2/utilities.js ../css2/style.css ../index2.html >&/dev/null &'
alias CM2='cd ~/workspace/Color\ Madness/bin && nohup gedit ../js/main.js ../js/events.js ../js/draw.js ../js/utilities.js ../css/style.css ../index.html >&/dev/null &'
alias PE='cd ~/workspace/Project\ Euler\ X/; nohup gedit main.cpp include/problems.h problems.cpp math_euler.cpp include/math_euler.h >&/dev/null &'
alias FI='nohup gedit /run/media/mmeloux/Documents/Documents/Archive\ documents/Films.txt >&/dev/null &'
alias NET='nohup ~/netbeans-8.0.1/bin/netbeans >&/dev/null &'
alias MAKE="for i in {1..25}; do echo; done; make -j 2"
alias MAKE2="for i in {1..25}; do echo; done; make -j 2 clean && make -j 2"

# Beep
alias PR='PROMPT_COMMAND="echo -en " && echo Success'
alias PRE='PROMPT_COMMAND="prompt_command" && echo End'

# Keyboard layouts
alias FR='setxkbmap fr && echo FR'
alias PL='setxkbmap pl && echo PL'
alias BEPO='setxkbmap bepo && echo BEPO'
alias EN='setxkbmap us && echo US'

# Git
alias PUSH='git push'
alias PULL='git pull'
alias COMMIT='git commit -am'
alias ADD='git add'
alias COMMIT='git commit -m'
alias COMMITA='git commit -am'
alias GITRESET='git fetch --all; git reset --hard origin/master'

# Navigation
LS_COLORS=$LS_COLORS:'di=1;44:' ; export LS_COLORS
alias ls='ls --color=auto'
alias LD='ls -d .*/ */'
alias LL='ls -alF'  #'list long'
alias LA='ls -A'    #'list all'
alias L='ls -CF'    #'list'
alias LCR='ls -cr'  #'list changed recently'
alias LC='ls -c'    #'list changed'
alias CD='cd; clear'
alias CL='cd; clear'
alias ..='cd ..'
alias ,,='pushd .. > /dev/null'
alias ++='popd > /dev/null'
alias ii="cd -"

# Binds
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Disk usage repartition
alias DUF='du -sk * | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'
# File cleanup
# alias CCL='for i in /tmp/* /var/tmp/* /var/log/* /var/lib/systemd/coredump/* /var/cache/* ~/.cache/* ~/.ccache/*; do du -s "$i" 2>/dev/null|cut -f 1; sudo rm -r "$i" 2>/dev/null; done|tr '\n' '+'|sed "s/.$/\n/"|bc|sed -r ":L;s=\b([0-9]+)([0-9]{3})\b=\1 \2=g;t L"; sudo systemd-tmpfiles --clean'
alias CCL='sudo rm -rf /tmp/* /var/tmp/* /var/log/* /var/lib/systemd/coredump/* /var/cache/* ~/.cache/* ~/.ccache/*; sudo systemd-tmpfiles --clean'
# Hannah
alias HANC='sqlite3 ~/.Skype/pie3636/main.db ".dump Messages" |grep -v "thread.skype" | grep bluerazor71 |wc -l'
#time sqlite3 ~/.Skype/pie3636/main.db ".dump Messages" | grep -v "thread.skype" | grep bluerazor71 | sed -e "s/^[^']*'[^']*','[^']*','//g" | sed -e "s/\([^']\)'[^']*'[^']*',\(NULL\|'[^']*'\),\([0-9]*\)[A-Z0-9,]*\(NULL\|'[^']*'\),[^']*'\(.*\)'.*/\1 (\3): \5/g" | sed -e 's/<[^>]*>//g' | sed -e "s/&apos;/'/g" | sed -e 's/&quot;/"/g' > ~/Convo_Hannah

# modprobe cpufreq_ondemand

function MKCD { mkdir -p "$1" && cd "$1"; }
function CCAT { grep --color=always -rnC3 -- "$@" . | less -R; }
function CK { xdotool click --delay $(echo 1000/$1|bc) --repeat $(echo $2*$1|bc) 1; }
function QUIET { ( $* &> /dev/null & ); }
function LQ { nohup "$@"&exit; }
function cd { builtin cd "${@}" && ls; }
function CPU() { for i in " " {1..3}; do grep "cpu$i" /proc/stat | awk '{usage=int(($2+$4)*10000/($2+$4+$5))/100} END {print usage "%"}' | sed -e "s/\%/%/g"; done; }
function POS() { echo -ne "\033[6n" && read -s -d\[ foo && read -s -d R pos; } # Request position, discard first part of answer, store rest
function HANR() { time sqlite3 ~/.Skype/pie3636/main.db ".dump Messages" | grep -v "thread.skype" | grep bluerazor71 | cut -d "," -f 6,10,18 | sed -e "s/'\(.*\)',\(.*\),'\([^']*\)'*/\1 (\2): \3/" | sed -e 's/<[^>]*>//g' | sed -e "s/&apos;/'/g" | sed -e 's/&quot;/"/g' > ~/Convo_Hannah; }
function CAL() { echo "scale=10;$*" | bc -l; }
function ,() { pushd "$1" > /dev/null; }
function MET() { play -n -c1 synth 0.001 sine 1000 pad `awk "BEGIN { print 60/$1 -.001 }"` repeat 9999999; }
function COL {
        local START=${1:-1}
        local END=${2:-$START}
        local FORM=${3:-0}
        for fgbg in 38 48; do
                for (( color=$START; color<=$END; color++ )); do
                        echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
                        if [ $((($color - $START + 1) % 10)) == 0 ]; then echo; fi
                done
                echo
        done
        if [ $FORM -ne 0 ]
        then
                for clfg in {30..37} {90..97} 39; do
                        for attr in 0 1 2 3 4 7 ; do
                                echo -en "\e[${attr};${clfg}m[${attr};${clfg}m \e[0m"
                        done
                        echo
                done
        fi
}

function IP {
        echo -n "Ethernet: "
        ip addr show eth0 | grep inet | awk '{print $2}' | tr "\n" " " | cut -f1 -d"/"
        echo -n "Wi-fi:    "
        ip addr show wlp2s0 | grep inet | awk '{print $2}' | tr "\n" " " | cut -f1 -d"/"
        echo -n "Public:   "
        curl http://icanhazip.com/
}

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

# Prompt
#PS1="[\t-\u@\h \w]\$ "
#PS1='if [ $? = 0 ]; then echo "\[\e[32m\]✔ "; else echo "\[\e[31m\]✘ "; fi`\[\e[0;37m\]\A \[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;30m\]\$\[\e[0m\]'
#PS1="\e[0;33m[\e[0;31m\t\e[m-\e[0;36m\u\e[0;32m@\h \e[0;35m\w\e[0;33m]\e[m$ "

function _show_git_status() {
        local unknown untracked stash clean ahead behind staged dirty diverged
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
        echo -ne "[\033[${color}m${branch}\033[0m]"
fi
return 0
}

function makePrompt {
        local pred="\[\033[0;31m\]"
        local pyellow="\[\e[1m\033[38;5;202m\]"
        bold=$'\e[1m'; underline=$'\e[4m'; dim=$'\e[2m'; strikethrough=$'\e[9m'; blink=$'\e[5m'; reverse=$'\e[7m'; hidden=$'\e[8m'; normal=$'\e[0m'; black=$'\e[30m'; red=$'\e[31m'; green=$'\e[32m'; orange=$'\e[33m'; blue=$'\e[34m'; purple=$'\e[35m'; aqua=$'\e[36m'; gray=$'\e[37m'; darkgray=$'\e[90m'; lightred=$'\e[91m'; lightgreen=$'\e[92m'; lightyellow=$'\e[93m'; lightblue=$'\e[94m'; lightpurple=$'\e[95m'; lightaqua=$'\e[96m'; white=$'\e[97m'; default=$'\e[39m'; BLACK=$'\e[40m'; RED=$'\e[41m'; GREEN=$'\e[42m'; ORANGE=$'\e[43m'; BLUE=$'\e[44m'; PURPLE=$'\e[45m'; AQUA=$'\e[46m'; GRAY=$'\e[47m'; DARKGRAY=$'\e[100m'; LIGHTRED=$'\e[101m'; LIGHTGREEN=$'\e[102m'; LIGHTYELLOW=$'\e[103m'; LIGHTBLUE=$'\e[104m'; LIGHTPURPLE=$'\e[105m'; LIGHTAQUA=$'\e[106m'; WHITE=$'\e[107m'; DEFAULT=$'\e[49m';
        if [ "$UID" != "0" ]; then
                local SYMBOL="$"
                local UNAME_COLOR="\[\033[1;35m\]"
                local FINAL_COLOR="\[\033[0m\]"
                namecolor="$white"
        else
                local SYMBOL="#"
                local UNAME_COLOR="\[\033[1;34m\]"
                local FINAL_COLOR="\[\033[0;32m\]"
                namecolor="$red"
        fi
        interface=$(/usr/bin/tty | /bin/sed -e 's:/dev/::')
        promusername="$USER"
        promhostname="$HOSTNAME"
        mem=$(echo "scale=1;100*$(free | grep Mem | sed -e "s/ \+/ /g" |cut -d " " -f 7)/8062472"|bc | sed -e "s/$/%/g" | sed -e "s/^/Mem:/g")
        swap=$(echo "scale=1;100*$(free | grep Swap | sed -e "s/ \+/ /g" |cut -d " " -f 4)/8142844"|bc | sed -e "s/$/%/g" | sed -e "s/^/Swap:/g")
        sedhome=$(sed 's/[][\.*^$(){}?+|/]/\\&/g' <<< "$HOME")
        function prompt_command {
                returnStatus="$?"
                errortest=$(if [[ "$returnStatus" != "0" ]]
        then
                echo " $bold$lightred✘ "
        else
                echo " $bold$lightgreen✔ "
        fi)
        git_status=$(_show_git_status)
        if [[ -n "$git_status" ]]; then
                git_status=":${git_status}"
        fi
        currentdir=$(pwd | sed "s/${sedhome}/~/g")
        battest=$(acpi | tr ' ' '\n' | grep '%' | tr -d '%,')
        if [[ "$battest" == "100" ]]
        then
                battery="$purple🔌⚡"
        elif [[ "$battest" -gt "89" ]]
        then
                battery="$green█ "
        elif [[ "$battest" -gt "79" ]]
        then
                battery="$green▇ "
        elif [[ "$battest" -gt "69" ]]
        then
                battery="$green▆ "
        elif [[ "$battest" -gt "59" ]]
        then
                battery="$green▅ "
        elif [[ "$battest" -gt "49" ]]
        then
                battery="$green▄ "
        elif [[ "$battest" -gt "39" ]]
        then
                battery="$orange▃ "
        elif [[ "$battest" -gt "29" ]]
        then
                battery="$orange▂ "
        elif [[ "$battest" -gt "19" ]]
        then
                battery="$red▁ "
        else
                battery="$red✘!"
        fi
        stopped=$(jobs -s | wc -l | tr -d " ")
        running=$(jobs -r | wc -l | tr -d " ")
        dateget=$(date +"%a %D %X")
        filecount=$(ls -1 | wc -l | tr -d ' ')
        size=$(ls -lah | grep -m 1 total | /bin/sed "s/total //")
        length=$(echo "$promusername@$promhostname on $interface jobs:$running$stopped $filecount files $size $mem $swap __ $dateget" | wc -c)
        echo -en "\033[s\
                \033[H\033[K"
        echo -en "$BLACK$bold$namecolor"
        if [ $length -gt $COLUMNS ]; then
                echo -en "$promusername@$promhostname$normal$white$BLACK on $bold$lightblue$interface$lightred jobs:$lightgreen$running$lightred$stopped$lightaqua $filecount files $lightorange$size $lightpurple$mem $lightgreen$swap $BLACK$(printf "\n%$((COLUMNS-26))s\n")$yellow$battery $lightpurple$dateget$normal$BLACK$green\033[K\n$currentdir \
                        \033[K\
                        \033[u\033[1A\033[1B$default$DEFAULT" # 26 = wc (__ dateget)
                #POS
                #if [ ${pos:0:1} == "2" ]; then if [ ${pos:1:1} == ";" ]; then echo; echo; fi; fi # Fix first line
        else
                echo -en "$promusername@$promhostname$normal$white$BLACK on $bold$lightblue$interface$lightred jobs:$lightgreen$running$lightred$stopped$lightaqua $filecount files $lightorange$size $lightpurple$mem $lightgreen$swap $BLACK$(printf "%$((COLUMNS-length))s\n")$yellow$battery $lightpurple$dateget\033[K\n$normal$BLACK$green$currentdir \
                        \033[K\
                        \033[u\033[1A\033[1B$default$DEFAULT"
                #POS
                #if [[ ${pos:0:1} == "1" ||  ${pos:0:1} == "2" ]]; then if [ ${pos:1:1} == ";" ]; then echo; fi; fi # Fix first line
        fi
}
echo -ne "\033]0;$interface @${HOSTNAME}\007"
export PROMPT_COMMAND=prompt_command
PS1="$pyellow\!\$errortest$normal\$git_status$normal$UNAME_COLOR$SYMBOL$FINAL_COLOR "
export PS1;
}

makePrompt
