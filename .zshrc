autoload -U compinit && compinit
autoload -U colors && colors

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
