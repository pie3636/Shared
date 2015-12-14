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
source /Xilinx/env-12.2.sh
source ~/TP/CEP/cep_leroussm_melouxm/bin/settings.sh
PATH=$PATH:/opt/mips-tools-cep/bin
export PATH
alias ccat='pygmentize -g'
alias douille='ddd ./perso_frame3'
alias RND6='GET "https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new"'
alias RND='cat /dev/urandom | hexdump -b | head -n 1 | cut -d " " -f 2 | sed -e "s/..//" | sed -e "s/$/\/4/" | bc'
alias emacs='echo "EMACS SUCKS" && sleep 1 && vim'
alias VIM="vim --servername VIM"
clear
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

PS1='\e[0;32m[\u@\h \W]\e[0m\$ '

