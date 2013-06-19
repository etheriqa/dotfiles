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

PROMPT="
%{[38;5;${colorcode}m%}%n@%m%{${reset_color}%}:%~ %1v
%# "

alias c="clear"
alias g="git"
alias gi="git"
alias l="ls -l"
alias la="ls -a -l"
alias pu="phpunit --colors --strict --verbose"
alias s="ssh"
alias v="vim"
alias vi="vim"

t() {
  if [ -z $1 ]; then
    tmux attach 2> /dev/null || tmux new
  elif tmux has -t $1 2> /dev/null; then
    tmux attach -t $1
  else
    tmux new -s $1
  fi
}

st() {
  if [ -z $1 ]; then
    echo "no hostname given"
    return 1
  elif [ -z $2 ]; then
    ssh -t $1 "tmux attach 2> /dev/null || tmux new"
  else
    ssh -t $1 "if tmux has -t $2 2> /dev/null; then tmux attach -t $2; else tmux new -s $2; fi"
  fi
}

case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshrc.darwin ]; then . $HOME/.zshrc.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshrc.linux ]; then . $HOME/.zshrc.linux; fi
    ;;
esac

if [ -f $HOME/.zshrc.local ]; then . $HOME/.zshrc.local; fi
