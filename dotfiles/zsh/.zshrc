#! /usr/bin/env zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Tab configuration
setopt menu_complete

# History file configuration
[[ -z "$HISTFILE" ]] && HISTFILE="$HOME/.zsh_history"
[[ "$HISTSIZE" -lt 50000 ]] && HISTSIZE=50000
[[ "$SAVEHIST" -lt 10000 ]] && SAVEHIST=10000

plugins=(git gitfast z)

export SRC_PATH="/Users/larspapen/5Minds"

source $ZSH/oh-my-zsh.sh

# Aliases definition
alias l="ls -lahF"
alias reload='source ~/.zshrc && echo reloaded'
alias findBigFiles='du -hs $(ls)'

alias glg="git log --oneline --decorate --graph --all"
alias gst="git status"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gud="git pull --all && git fetch --prune"
alias gbd="git branch --merged | egrep -v '(^\*|master|dev|main)' | xargs git branch -d"
alias gpsup="git push --set-upstream origin $(git_current_branch)"
alias ghu='open `git remote -v | grep fetch | head -1 | cut -f2 | cut -d'\'' '\'' -f1 | sed -e'\''s/git@/http:\/\//'\'' -e'\''s/\.git$//'\'' | sed -E '\''s/(\/\/[^:]*):/\1\//'\''`'

# Application sourcing
[[ -r "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
