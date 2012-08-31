autoload -U compinit && compinit
autoload -U colors && colors

bindkey -v

autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

PROMPT="
%{${fg[green]}%}%n@%m%{${reset_color}%}:%~ %1v
%# "

