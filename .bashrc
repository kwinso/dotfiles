#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

force_color_prompt=yes


alias gg="lazygit"

# GO Path
export PATH=$(go env GOPATH)/bin:$PATH

# CTF Vars
export CTF_ROOT="/home/mouse/ctf"
export HTB="$CTF_ROOT/htb"
export THM="$CTF_ROOT/thm"

alias htbd="cd $HTB"
alias thmd="cd $THM"
alias vpn="sudo openvpn"

alias l="ls -la"
alias cat="bat"
alias catraw="/bin/cat"
alias dco="docker compose"
alias hx="helix"

export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM="xterm-256color"

set -o vi
shopt -s autocd
# . "$HOME/.cargo/env"

eval "$(thefuck --alias)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
