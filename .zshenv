export LANG=en_US.UTF-8
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

# pythonbrew
if [ -r $HOME/.pythonbrew/etc/bashrc ]; then
  source $HOME/.pythonbrew/etc/bashrc
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
