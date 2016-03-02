case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshenv.darwin ]; then . $HOME/.zshenv.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshenv.linux ]; then . $HOME/.zshenv.linux; fi
    ;;
esac

export CDPATH=$HOME/src/github.com/etheriqa:$HOME/src/bitbucket.org/etheriqa:$HOME/workspace:$HOME/src:$HOME
export EDITOR=vim
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
export LESS="--LONG-PROMPT --RAW-CONTROL-CHARS"
export PATH=$HOME/bin:$PATH
export TERM=xterm-256color

# anyenv
if [ -x $HOME/.anyenv/bin/anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init - zsh)"
fi

# cabal
if [ -x $HOME/.cabal/bin ]; then
  export PATH=$HOME/.cabal/bin:$PATH
fi

# golang
export GOPATH=$HOME

# docker-machine
if command which -s docker-machine; then
  eval "$(docker-machine env default)"
fi

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
