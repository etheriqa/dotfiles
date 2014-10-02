case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshenv.darwin ]; then . $HOME/.zshenv.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshenv.linux ]; then . $HOME/.zshenv.linux; fi
    ;;
esac

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export EDITOR=vim
export TERM=screen-256color

# anyenv
if [ -x $HOME/.anyenv/bin/anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init - zsh)"
fi

# cabal
if [ -x $HOME/.cabal/bin ]; then
  export PATH=$HOME/.cabal/bin:$PATH
fi

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
