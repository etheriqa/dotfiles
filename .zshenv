export PATH=$HOME/bin:/usr/local/bin:$HOME/.phpenv/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export LANG=en_US.UTF-8
export EDITOR=vim

alias v="vim"
alias vi="vim"
alias g="git"
alias gi="git"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init - zsh)"; fi
