export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export EDITOR=vim
export TERM=screen-256color

# rbenv
if [ -x $HOME/.rbenv/bin/rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init - zsh)"
fi

# phpenv
if [ -x $HOME/.phpenv/bin/phpenv ]; then
  export PATH=$HOME/.phpenv/bin:$PATH
  eval "$(phpenv init - zsh)"
fi

# nodebrew
if [ -x $HOME/.nodebrew/current/bin/nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export NODEBREW_ROOT=$HOME/.nodebrew
fi

# pyenv
if [ -x $HOME/.pyenv/bin/pyenv ]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# cabal
if [ -x $HOME/.cabal/bin ]; then
  export PATH=$HOME/.cabal/bin:$PATH
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
