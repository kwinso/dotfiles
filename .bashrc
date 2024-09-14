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
export PATH=/opt/intellij-idea/bin:$PATH

alias vpn="sudo openvpn"

alias l="ls -la"
alias cat="bat"
alias catraw="/bin/cat"
alias dco="docker compose"
alias d="docker"

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

# pnpm
export PNPM_HOME="/home/mouse/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

