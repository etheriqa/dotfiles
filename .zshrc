autoload -U compinit && compinit
autoload -U colors && colors

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey -v

autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

local color_hostname=${color_hostname:-$fg[green]}

PROMPT="
%{${color_hostname}%}%n@%m%{${reset_color}%}:%~ %1v
%# "

alias g="git"
alias gi="git"
alias l="ls -l"
alias la="ls -a -l"
alias lp="ionice -c2 -n7 nice -n 19"
alias pu="phpunit --colors --strict --verbose"
alias s="ssh"
alias t="tmux attach 2> /dev/null || tmux new"
alias v="vim"
alias vi="vim"

st() { ssh -t "$1" 'tmux attach || tmux new'; }
