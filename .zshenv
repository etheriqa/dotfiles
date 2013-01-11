export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color

alias g="git"
alias gi="git"
alias l="ls -l"
alias la="ls -a -l"
alias lp="ionice -c2 -n7 nice -n 19"
alias pu="phpunit --strict --colors"
alias t="tmux"
alias v="vim"
alias vi="vim"

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
