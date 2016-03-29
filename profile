# vim: ft=sh

profile_darwin(){
  eval $(PATH= MANPATH= /usr/libexec/path_helper)
  export PATH=$PATH:
  export MANPATH=$MANPATH:

  # coreutils
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

  # docker-machine
  if command which -s docker-machine; then
    eval "$(docker-machine env default)"
  fi
}

profile_linux(){
  export PATH=$HOME/local/bin:$PATH
  export LD_LIBRARY_PATH=$HOME/local/lib
}

profile_base(){
  export CDPATH=$HOME/src/github.com/etheriqa:$HOME/src/bitbucket.org/etheriqa:$HOME/workspace:$HOME/src:$HOME
  export EDITOR=vim
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US:en
  export LC_ALL=en_US.UTF-8
  export LESS="--LONG-PROMPT --RAW-CONTROL-CHARS"
  export PATH=$HOME/bin:$PATH
  export TERM=xterm-256color
  export GREP_OPTIONS="--color=auto"

  # anyenv
  if [ -x $HOME/.anyenv/bin/anyenv ]; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init - $(basename $SHELL))"
  fi

  # cabal
  if [ -x $HOME/.cabal/bin ]; then
    export PATH=$HOME/.cabal/bin:$PATH
  fi

  # golang
  export GOPATH=$HOME
}

case $OSTYPE in
  darwin*) profile_darwin ;;
  linux*) profile_linux ;;
esac

profile_base

unset -f profile_darwin
unset -f profile_linux
unset -f profile_base
