autoload -U compinit && compinit
autoload -U colors && colors

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey -v

autoload -Uz vcs_info
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

PROMPT="
%{[38;5;${colorcode}m%}%n@%m%{${reset_color}%}:%~ %1v
%# "

alias c="clear"
alias g="git"
alias ga="git add"
alias gap="git add --patch"
alias gau="git add --update"
alias gb="git branch"
alias gbb="git bisect bad"
alias gbd="git branch --delete"
alias gbD="git branch -D"
alias gbg="git bisect good"
alias gbl="git blame -w"
alias gbm="git branch --move"
alias gbr="git bisect reset"
alias gbs="git bisect start"
alias gc="git commit --verbose"
alias gca="git commit --verbose --all"
alias gcam="git commit --verbose --all --amend"
alias gcm="git commit --verbose --amend"
alias gcma="git commit --verbose --amend --all"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfo="git fetch origin"
alias gg="git grep"
alias gm="git merge --no-ff"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gmf="git merge --ff-only"
alias gms="git merge --squash"
alias gp="git cherry-pick"
alias gpl="git pull"
alias gps="git push"
alias gra="git remote add"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grbs="git rebase --skip"
alias grh="git reset --hard"
alias grr="git remote rm"
alias grs="git reset --soft"
alias grv="git revert"
alias gs="git status --short --branch"
alias gsc="git stash clear"
alias gsl="git stash list"
alias gsm="git submodule"
alias gsmu="git submodule update"
alias gsp="git stash pop"
alias gss="git stash save"
alias l="ls -l"
alias la="ls -a -l"
alias pu="phpunit --colors --strict --verbose"
alias rm="rm -i"
alias s="ssh"
alias v="vim"
alias vi="vim"

t() {
  if [ -z $1 ]; then
    tmux attach 2> /dev/null || tmux new
  elif tmux has -t $1 2> /dev/null; then
    tmux attach -t $1
  else
    tmux new -s $1
  fi
}

st() {
  if [ -z $1 ]; then
    echo "no hostname given"
    return 1
  elif [ -z $2 ]; then
    ssh -t $1 "tmux attach 2> /dev/null || tmux new"
  else
    ssh -t $1 "if tmux has -t $2 2> /dev/null; then tmux attach -t $2; else tmux new -s $2; fi"
  fi
}

case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshrc.darwin ]; then . $HOME/.zshrc.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshrc.linux ]; then . $HOME/.zshrc.linux; fi
    ;;
esac

if [ -f $HOME/.zshrc.local ]; then . $HOME/.zshrc.local; fi
