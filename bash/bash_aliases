### FUNCTIONS

# Easy extract
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}


# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }


# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# A better dictectory change.
function cdl {
    cd $1
    ls
}

# A faster way of making new scripts
function nesh {
    touch $1
    chmod ug+x $1
    nano $1
}

## Keeping things organized
alias df='df -h'
alias du='du -h -c'
alias ls='ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p -v'
alias l='ls -GF'
alias lr='ls -lR'
alias lk='ls -lSr'
alias la='ls -Al'
alias lm='ls -Al | more'
alias lt='ls -ltr'
alias ll='ls -l'
alias lsd='ls -l | grep "^d"'

## Dir shortcuts
alias documents='cd ~/Documents && l'
alias dropbox='cd ~/Dropbox && l'
alias projects='cd ~/Projects && l'
alias downloads='cd ~/Downloads && l'
alias images='cd ~/Images && l'
alias torrents='cd ~/dl && l'
alias videos='cd ~/Videos && l'
alias localhost='cd /var/www && l'
alias powerdown='sudo shutdown -P -h now'
alias ubin='cd ~/.bin && l'
alias reload='. ~/.bash_profile'

## SSH STUFF

alias sulacor='ssh -C -c blowfish neuralsandwich@sulaco -p 443'
alias sulacox='ssh -C -c blowfish -X  neuralsandwich@sulaco -p 443'
alias sulacol='ssh neuralsandwich@192.168.0.254 -p 443'
alias sulacolx='ssh -X neuralsandwich@192.168.0.254 -p 443'
alias sulacotunnel='ssh -MNf neuralsandwich@sulaco -p 443'

## Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Colo
