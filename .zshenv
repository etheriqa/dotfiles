export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=screen-256color

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init - zsh)"
fi

# phpenv
if [ -d $HOME/.phpenv ]; then
  export PATH=$HOME/.phpenv/bin:$PATH
  eval "$(phpenv init - zsh)"
fi

# nodebrew
if [ -d $HOME/.nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export NODEBREW_ROOT=$HOME/.nodebrew
fi

case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshenv.darwin ]; then . $HOME/.zshenv.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshenv.linux ]; then . $HOME/.zshenv.linux; fi
    ;;
esac

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
