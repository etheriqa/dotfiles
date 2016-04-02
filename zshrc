autoload -U compinit && compinit -u
autoload -U colors && colors

REPORTTIME=1
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey -v

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' [%s:%b]'
zstyle ':vcs_info:*' actionformats ' [%s:%b|%a]'
precmd() {
  vcs_info
  psvar[1]=$vcs_info_msg_0_
}

case $colorcode in
  honoka*)
    local colorcode=208
    ;;
  eli*)
    local colorcode=87
    ;;
  kotori*)
    local colorcode=247
    ;;
  umi*)
    local colorcode=27
    ;;
  rin*)
    local colorcode=190
    ;;
  maki*)
    local colorcode=196
    ;;
  nozomi*)
    local colorcode=55
    ;;
  hanayo*)
    local colorcode=47
    ;;
  nico*)
    local colorcode=199
    ;;
esac

PROMPT="
%{[38;5;${colorcode-15}m%}%n@%m%{${reset_color}%}:%~%1v
%# "

. $(dirname $0)/rc
