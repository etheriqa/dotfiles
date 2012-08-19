export PATH=$HOME/bin:$HOME/.rbenv/shims:$HOME/.phpenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export LANG=en_US.UTF-8

autoload -U compinit && compinit
autoload -U colors && colors

bindkey -v
alias v="vi"
alias g="git"

export EDITOR=vi

autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

PROMPT="
%{${fg[green]}%}%n@%m%{${reset_color}%}:%~ %1v
%# "
