case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshrc.darwin ]; then . $HOME/.zshrc.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshrc.linux ]; then . $HOME/.zshrc.linux; fi
    ;;
esac

autoload -U compinit && compinit -u
autoload -U colors && colors

REPORTTIME=1
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

case $colorcode in
  honoka*)
    local colorcode=208
    ;;
  eli*)
    local colorcode=87
    ;;
  kotori*)
    local colorcode=247
    ;;
  umi*)
    local colorcode=27
    ;;
  rin*)
    local colorcode=190
    ;;
  maki*)
    local colorcode=196
    ;;
  nozomi*)
    local colorcode=55
    ;;
  hanayo*)
    local colorcode=47
    ;;
  nico*)
    local colorcode=199
    ;;
esac

PROMPT="
%{[38;5;${colorcode-15}m%}%n@%m%{${reset_color}%}:%~ %1v
%# "

alias dl="curl --continue-at - --location --remote-name"
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
alias gf="git fetch --prune"
alias gfa="git fetch --prune --all"
alias gfo="git fetch --prune origin"
alias gfu="git fetch --prune upstream"
alias gg="git grep"
alias ggl="git grep --name-only"
alias gl="git ls-files"
alias gm="git merge --no-ff"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gmf="git merge --ff-only"
alias gms="git merge --squash"
alias gmv="git mv --verbose"
alias gp="git cherry-pick"
alias gpl="git pull"
alias gplo="git pull origin"
alias gpn="git cherry-pick --no-commit"
alias gps="git push"
alias gpso="git push origin"
alias gpst="git push --tags"
alias gr="git reset"
alias gra="git remote add"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grbs="git rebase --skip"
alias grh="git reset --hard"
alias grm="git rm -r"
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
alias gt="git tag"
alias l="ls --color -l"
alias la="ls --color -al"
alias lb="stdbuf -oL"
alias ls="ls --color"
alias make="make --jobs $(nproc)"
alias par="parallel --eta --jobs $(nproc) --progress"
alias reload="exec $SHELL -l"
alias socks="ssh -D 2222 -f -N"
alias vi="vim"
alias view="vim -R"
alias x="xargs"

pomodoro() {
  for i in $(seq 6); do
    echo "$(date +%H:%M:%S) #$i      " | tee /dev/stderr | write $(whoami)
    sleep 1500
    if [ $i -eq 6 ]; then
      echo "$(date +%H:%M:%S) END     " | tee /dev/stderr | write $(whoami)
    else
      echo "$(date +%H:%M:%S) INTERVAL" | tee /dev/stderr | write $(whoami)
      sleep 300
    fi
  done
}

t() {
  local session=${1-default}
  if tmux has -t $session 2> /dev/null; then
    tmux attach -t $session
  else
    tmux new -s $session
  fi
}

st() {
  local hostname=$1
  local session=${2-default}
  if [ -z $hostname ]; then
    echo "no hostname given"
    return 1
  else
    ssh -t $hostname "if tmux has -t $session 2> /dev/null; then tmux attach -t $session; else tmux new -s $session; fi"
  fi
}

if [ -f $HOME/.zshrc.local ]; then . $HOME/.zshrc.local; fi
