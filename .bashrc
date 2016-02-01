# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Minecraft
alias MC='optirun java -jar ~/Minecraft.jar &'
alias MC2='java -jar ~/Minecraft.jar &'
alias TK='optirun java -jar ~/TechnicLauncher.jar &'
alias TK2='java -jar ~/TechnicLauncher.jar &'

# VPN
alias VPN='sudo openconnect -b VPN2.grenet.fr --authgroup Etudiants_Grenoble_INP -u melouxm && clear'
alias VON='sudo openconnect -b VPN2.grenet.fr --authgroup Etudiants_Grenoble_INP -u melouxm && clear'
alias VPN2='sudo openconnect -b VPN.grenet.fr --authgroup Etudiants_Grenoble_INP -u melouxm && clear'
alias VON2='sudo openconnect -b VPN.grenet.fr --authgroup Etudiants_Grenoble_INP -u melouxm && clear'

# Misc
alias KO='sudo killall openconnect'
alias NM='sudo service NetworkManager restart && sleep 2 && rfkill unblock all && rfkill block bluetooth'
alias ST='sudo sh startup.sh'
alias NOST='sudo sh startup.sh 1'
alias RES='cp ~/.mozilla/firefox/gph8zx27.default/jetpack/jid1-xUfzOsOFlzSOXg@jetpack/simple-storage/store.json /run/media/mmeloux/Documents/Documents/Archive\ documents/res_settings.json'
alias MP4='for f in *.mp4; do ffmpeg -i "$f" -vn -c:a libmp3lame -ar 44100 -ac 2 -ab 192k "${f/%mp4/mp3}"; done'
alias KEY='cat /usr/share/X11/xkb/rules/xorg.lst'
alias TR='killall tracker-extract tracker-miner-apps tracker-miner-fs tracker-miner-user-guides tracker-store evolution-addressbook-factory evolution-alarm-notify evolution-calendar-factory-subprocess evolution-addressbook-factory-subprocess evolution-calendar-factory evolution-source-registry'
# Timer
alias GEP='~/gephi/bin/gephi& while [ $(ps -ax |grep gephi/bin|wc -l) -eq 2 ]; do for i in {1..10}; do echo -e "\a"; sleep 0.2; done; for i in {1..150}; do sleep 1; echo $i; done; done'
alias KA='ps -ax|grep'
#alias CCL='for i in /tmp/* /var/tmp/* /var/log/* /var/lib/mongo/journal/* /var/lib/systemd/coredump/* /var/cache/* ~/.cache/* ~/.ccache/* ~/hs_err_* ~/jagexcache/oldschool/LIVE/main*; do du -s "$i" 2>/dev/null|cut -f 1; sudo rm -r "$i" 2>/dev/null; done|tr '\n' '+'|sed "s/.$/\n/"|bc|sed -r ":L;s=\b([0-9]+)([0-9]{3})\b=\1 \2=g;t L"; sudo systemd-tmpfiles --clean; sudo package-cleanup --oldkernels --count=2 -y'
alias CCL='sudo rm -rf /tmp/* /var/tmp/* /var/log/* /var/lib/mongo/journal/* /var/lib/systemd/coredump/* /var/cache/* ~/.cache/* ~/.ccache/* ~/hs_err_* ~/jagexcache/oldschool/LIVE/main*; sudo systemd-tmpfiles --clean; sudo package-cleanup --oldkernels --count=2 -y'
# Opens random file
alias RND='find -type f|shuf|head -n 1|xargs -d "\n" xdg-open&'
alias emacs='vim'
# Disk usage repartition
alias DUF='du -sk * | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'
alias WATCH="tail -fs 0.2 -n $LINES"
alias PWD="pwgen --no-capitalize 20 1"

# Meta
alias VIM='vim ~/.bashrc'
alias SRC='source ~/.bashrc'

# Hannah
alias HAN='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ up >&/dev/null &'
alias HAN2='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ down >&/dev/null &'
alias HAN3='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ third >&/dev/null &'
alias HAN4='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ 4 >&/dev/null &'
alias HAN5='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ 5\ planks\ orange >&/dev/null &'
alias HANM='nohup gedit /run/media/mmeloux/Documents/Documents/Multimédia/Friends/Hannah\ Barton/Level\ meta >&/dev/null &'
alias HANC='sqlite3 ~/.Skype/pie3636/main.db ".dump Messages" |grep -v "thread.skype" | grep bluerazor71 |wc -l'
#time sqlite3 ~/.Skype/pie3636/main.db ".dump Messages" | grep -v "thread.skype" | grep bluerazor71 | sed -e "s/^[^']*'[^']*','[^']*','//g" | sed -e "s/\([^']\)'[^']*'[^']*',\(NULL\|'[^']*'\),\([0-9]*\)[A-Z0-9,]*\(NULL\|'[^']*'\),[^']*'\(.*\)'.*/\1 (\3): \5/g" | sed -e 's/<[^>]*>//g' | sed -e "s/&apos;/'/g" | sed -e 's/&quot;/"/g' > ~/Convo_Hannah

# Work
alias IJ='sh ~/idea-IC-135.1289/bin/idea.sh &'
alias FW='cd ~/workspace/Fire\ Watcher && nohup gedit utilities.js main.js io.js data.js index.html bootstrap-update.css >&/dev/null &'
alias CMS='cd ~/workspace/Color\ Madness/bin && nohup gedit server.js tools.js >&/dev/null &'
alias CMH='cd ~/workspace/Color\ Madness/bin && nohup gedit ../js2/main.js ../js2/events.js ../js2/draw.js ../js2/utilities.js ../css2/style.css ../index2.html >&/dev/null &'
alias CM2='cd ~/workspace/Color\ Madness/bin && nohup gedit ../js/main.js ../js/events.js ../js/draw.js ../js/utilities.js ../css/style.css ../index.html >&/dev/null &'
alias PE='cd ~/workspace/Project\ Euler\ X/; nohup gedit main.cpp include/problems.h problems.cpp math_euler.cpp include/math_euler.h >&/dev/null &'
alias FI='nohup gedit /run/media/mmeloux/Documents/Documents/Archive\ documents/Films.txt >&/dev/null &'

# Beep
alias PR='PROMPT_COMMAND="echo -en " && echo Success'
alias PRE='PROMPT_COMMAND="prompt_command" && echo End'

# Keyboard layouts
alias FR='setxkbmap fr && echo FR'
alias PL='setxkbmap pl && echo PL'
alias BEPO='setxkbmap bepo && echo BEPO'
alias EN='setxkbmap us && echo US'

# Navigation
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

# Binds
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

modprobe cpufreq_ondemand
PATH=" /opt/texlive/2014/bin/x86_64-linux:$PATH"
alias git='LANG=en_US git'
PAGER=less
export PAGER
#set -o vi

function MKCD { mkdir -p "$1" && cd "$1"; }
function CCAT { grep --color=always -rnC3 -- "$@" . | less -R; }
function CK { xdotool click --delay $(echo 1000/$1|bc) --repeat $(echo $2*$1|bc) 1; }
function QUIET { ( $* &> /dev/null & ); }
function LQ { nohup "$@"&exit; }
function FA { findInTypes "$1" "*.c,*.cpp,*.h,*.txt,*.sh,*.log,*.java,*.js,*.html,Makefile,*.css,*.py" "$2"; }
function RME { cd "$1" && find . -type d -empty -exec rmdir {} \;; }
function cd { builtin cd "${@}" && ls; }
function CPU() { for i in " " {1..7}; do grep "cpu$i" /proc/stat | awk '{usage=int(($2+$4)*10000/($2+$4+$5))/100} END {print usage "%"}' | sed -e "s/\%/%/g"; done; }
function POS() { echo -ne "\033[6n" && read -s -d\[ foo && read -s -d R pos; } # Request position, discard first part of answer, store rest
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
ip addr show wlo1 | grep inet | awk '{print $2}' | tr "\n" " " | cut -f1 -d"/"
echo -n "Public:   "
curl http://icanhazip.com/
}

# Find files of the specified types, and grep for the specified token. Additional grep options can be passed in in $3, but multiple params must be quoted (e.g., "-i -C3").
function findInTypes {
types=$(echo $2 | tr "," "\n")
cmd="find . \\( -path '*/.svn' -prune -false \\) -o -type f \\("
sep=" "
for t in $types; do
        cmd="${cmd}${sep}-name '$t'"
        sep=" -o "
done
cmd="$cmd \\) -exec grep $3 \"$1\" {} /dev/null \\;"
eval $cmd
}

function XTR() {
local c e i
(($#)) || return
for i; do
        c=''
        e=1
        if [[ ! -r $i ]]; then
                echo "$0: file is unreadable: \`$i'" >&2
                continue
        fi
        case $i in
                *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                        c='tar xfvz';;
                *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
*.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
*.gz)  c='gunzip';;
        *.rar) c='unrar x';;
*.xz)  c='unxz';;
        *.zip) c='unzip';;
*)     echo "$0: unrecognized file extension: \`$i'" >&2
        continue;;
        esac
        command $c "$i"
        e=$?
done
return $e
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
        stopped=$(jobs -s | wc -l | tr -d " ")
        running=$(jobs -r | wc -l | tr -d " ")
        dateget=$(date +"%a %D %X")
        filecount=$(ls -1 | wc -l | tr -d ' ')
        size=$(ls -lah | grep -m 1 total | /bin/sed "s/total //")
        length=$(echo "$promusername@$promhostname on $interface jobs:$running$stopped $filecount files $size $mem $swap $dateget" | wc -c)
        echo -en "\033[s\
                \033[H\033[K"
        echo -en "$BLACK$bold$namecolor"
        if [ $length -gt $COLUMNS ]; then
                echo -en "$promusername@$promhostname$normal$white$BLACK on $bold$lightblue$interface$lightred jobs:$lightgreen$running$lightred$stopped$lightaqua $filecount files $lightorange$size $lightpurple$mem $lightgreen$swap $BLACK$(printf "\n%$((COLUMNS-23))s\n") $lightpurple$dateget$normal$BLACK$green\033[K\n$currentdir \
                        \033[K\
                        \033[u\033[1A\033[1B$default$DEFAULT" # 23 = wc (dateget)
                #POS
                #if [ ${pos:0:1} == "2" ]; then if [ ${pos:1:1} == ";" ]; then echo; echo; fi; fi # Fix first line
        else
                echo -en "$promusername@$promhostname$normal$white$BLACK on $bold$lightblue$interface$lightred jobs:$lightgreen$running$lightred$stopped$lightaqua $filecount files $lightorange$size $lightpurple$mem $lightgreen$swap $BLACK$(printf "%$((COLUMNS-length))s\n") $lightpurple$dateget\033[K\n$normal$BLACK$green$currentdir \
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

source /Xilinx/env-12.2.sh
source ~/TP/CEP/cep_leroussm_melouxm/bin/settings.sh
PATH=$PATH:/opt/mips-tools-cep/bin
export PATH
alias ccat='pygmentize -g'
alias douille='ddd'
alias RND6='GET "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"'
alias RNDB='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'
clear

PS1='\e[0;32m[\u@\h \W]\e[0m\$ '

