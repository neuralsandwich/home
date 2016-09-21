# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy-kingdom"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=14

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [ `uname` = "Darwin" ]; then
  plugins=(git osx sublime battery macports terminalapp)
elif [ `uname` = "Linux" ]; then
  plugins=(git battery)
fi

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

# Variables
export EDITOR="vim"
export PAGER="vimpager"
export VISUAL="$EDITOR"
export PAGER="less -i"
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/opt/local/bin

## Customizations ##

## Welcome Message ##
if [ `uname -n` = "raspberrypi" ]; then
  let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
  let secs=$((${upSeconds}%60))
  let mins=$((${upSeconds}/60%60))
  let hours=$((${upSeconds}/3600%24))
  let days=$((${upSeconds}/86400))
  UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
  # get the load averages
  read one five fifteen rest < /proc/loadavg
  echo "$(tput setaf 2)
   .~~.   .~~.    `date +"%A, %e %B %Y, %r"`
  '. \ ' ' / .'   `uname -srmo`$(tput setaf 1)
   .~ .~~~..~.
  : .~.'~'.~. :   Uptime.............: ${UPTIME}
 ~ (   ) (   ) ~  Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
( : '~'.~.'~' : ) Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
 ~ .~ (   ) ~. ~  Running Processes..: `ps ax | wc -l | tr -d " "`
  (  : '~' :  )   IP Addresses.......: `/sbin/ifconfig eth0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1` and `wget -q -O - http://icanhazip.com/ | tail`
   '~ .~~~. ~'    Weather............: `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|UK|UK001|EDINBURGH|" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'` [Edinburgh]
       '~'
$(tput sgr0)"
elif [ `uname -n` = "verloc.neuralsandwich.com" ]; then
  let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
  let secs=$((${upSeconds}%60))
  let mins=$((${upSeconds}/60%60))
  let hours=$((${upSeconds}/3600%24))
  let days=$((${upSeconds}/86400))
  UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
  # get the load averages
  read one five fifteen rest < /proc/loadavg
  
  echo "
  $(tput setaf 1)        _sudZUZ#Z#XZo=_           $(tput setaf 2)`date +"%A, %e %B %Y, %r"`
  $(tput setaf 1)      _jmZZ2!!~---~!!X##wx        $(tput setaf 2)`uname -srmo`
  $(tput setaf 1)    .<wdP~~            -!YZL,
  $(tput setaf 1)   .mX2\'       _xaaa__     XZ[.  $(tput setaf 2)Uptime            : ${UPTIME}
  $(tput setaf 1)   oZ[      _jdXY!~?S#wa   ]Xb;   $(tput setaf 2)Memory Free/Total : `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB
  $(tput setaf 1)  _#e\'     .]X2(     ~Xw|  )XXc  $(tput setaf 2)Load Averages     : ${one}, ${five}, ${fifteen}
  $(tput setaf 1) .2~\'      ]x[.       xY|  ]oZ(  $(tput setaf 2)Processes         : `ps ax | wc -l | tr -d ' '`
  $(tput setaf 1) .2#;      )3k;     _s!~   jXf\`   $(tput setaf 2)Local IP          : `/sbin/ifconfig eth0 | /bin/grep 'inet addr' | /usr/bin/cut -d ':' -f 2 | /usr/bin/cut -d ' ' -f 1`
  $(tput setaf 1)  1Z>      -]Xb/    ~    __#2(    $(tput setaf 2)External IP       : `wget -q -O - http://icanhazip.com/ | tail`
  $(tput setaf 1)  -Zo;       +!4ZwerfgnZZXY\'     $(tput setaf 2)Weather Edinburgh : `curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|UK|UK001|EDINBURGH|' | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
  $(tput setaf 1)   *#[,        ~-?!!!!!!-~
  $(tput setaf 1)    XUb;.
  $(tput setaf 1)     )YXL,,
  $(tput setaf 1)       +3#bc,
  $(tput setaf 1)         -)SSL,,
  $(tput setaf 1)            ~~~~~\"
  $(tput setaf 1)$(tput sgr0)"
elif [[ `hostname` = "nostromo" ]]; then
    echo "
    $(tput sgr0)                     .8           $(tput setaf 2)`date +"%A, %e %B %Y, %r"`
    $(tput sgr0)                  .888'           $(tput setaf 2)`uname -srm`
    $(tput sgr0)                .8888'
    $(tput sgr0)                888'              $(tput setaf 2)Uptime            : `uptime | sed -e "s/^.* up/up/g" | sed -e 's/,.*//g'`
    $(tput sgr0)                8'                $(tput setaf 2)Memory Free/Total :
    $(tput sgr0)    .8888888888. .8888888888.     $(tput setaf 2)Load Averages     : `uptime | sed -e 's/^.*load averages: //g'`
    $(tput sgr0) .888888888888888888888888888.    $(tput setaf 2)Processes         : `ps ax | wc -l | tr -d ' '`
    $(tput sgr0).&&&&&&&&&&&&&&&&&&&&&&&&&&'      $(tput setaf 2)Local IP          : `/sbin/ifconfig en1 | /usr/bin/grep 'inet' | sed -e 's/\n//g' |/usr/bin/cut -d ':' -f 2 | /usr/bin/cut -d ' ' -f 2 | tr -d '\n' | sed -e 's/%//'`
    $(tput sgr0)&&&&&&&&&&&&&&&&&&&&&&&&&'        $(tput setaf 2)External IP       : `wget -q -O - http://icanhazip.com/ | tail`
    $(tput sgr0)@@@@@@@@@@@@@@@@@@@@@@@@'         $(tput setaf 2)Weather Edinburgh : `curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|UK|UK001|EDINBURGH|' | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
    $(tput sgr0)@@@@@@@@@@@@@@@@@@@@@@@@
    $(tput sgr0)\`%%%%%%%%%%%%%%%%%%%%%%%
    $(tput sgr0)\`%%%%%%%%%%%%%%%%%%%%%%%%.
    $(tput sgr0) \`000000000000000000000000.
    $(tput sgr0)  '0000000000000000000000000.
    $(tput sgr0)   '##########################'
    $(tput sgr0)    \`###########''###########'
    $(tput sgr0)     \`#########'  '#########'$(tput sgr0)"
else
  echo "Yo!"
fi

# imported .bash_aliases
alias 'dus=du -sckx * | sort -nr'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias lh='ls -a | egrep "^\."'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gap='git add -p'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
# leverage an alias from the ~/.gitconfig
alias gh='git hist'

# -------------------------------------------------------------------
# Functions ported directly from .bashrc
# -------------------------------------------------------------------
# Only activate functions if they work on the platform
if [ `uname` = "Darwin" ]; then
  # turn hidden files on/off in Finder
  function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
  function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }
  # view man pages in Preview
  function pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi

# myIP address
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# --------------------------------------------------------------------
# Functions ported from .bash_aliases
# --------------------------------------------------------------------
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

### Dir shortcuts
alias docs='cd ~/Documents && l'
alias dbx='cd ~/Dropbox && l'
alias powerdown='sudo shutdown -P -h now'
alias ubin='cd ~/.bin && l'
alias reload='source ~/.zshrc'

# Start tmux - Can't not be in tmux
[[ $TERM != "screen" ]] && exec tmux
