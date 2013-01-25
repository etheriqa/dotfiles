export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color
export PATH=$HOME/.phpenv/bin:$HOME/.rbenv/bin:$PATH

alias g="git"
alias gi="git"
alias l="ls -l"
alias la="ls -a -l"
alias lp="ionice -c2 -n7 nice -n 19"
alias pu="phpunit --strict --colors"
alias t="tmux"
alias v="vim"
alias vi="vim"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init - zsh)"; fi

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
