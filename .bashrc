#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

force_color_prompt=yes

alias grep="grep --color=auto"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias gaa="git add ."
alias gcm="git commit -m"
alias gpo="git push -u origin"

# CTF Vars
export CTF_ROOT="/home/mouse/ctf"
export HTB="$CTF_ROOT/htb"
export THM="$CTF_ROOT/thm"

alias htbd="cd $HTB"
alias thmd="cd $THM"
alias vpn="sudo openvpn"
