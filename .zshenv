export PATH=$HOME/bin:$HOME/.phpenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export LANG=en_US.UTF-8
export EDITOR=vim

alias v="vim"
alias vi="vim"
alias g="git"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
