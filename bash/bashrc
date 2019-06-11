# Neuralsandwich's personalised .bashrc

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# Taken from http://tldp.org/LDP/abs/html/sample-bashrc.html

if shopt -q login_shell; then
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

export CVSROOT=":ext:seanj@taurus:/var/lib/prismcvs"



# Get hostname
function box_name() {
  hostname -s
}

# Display if shell is ssh
if [[ -n "$SSH_CLIENT" ]] ; then ssh_client='[SSH]'
fi

# Prompt
PS1='\n\u@\h$ssh_client\w\n$ '

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
elif [[ `uname` = "Darwin" ]] ; then
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
  elif [[ `cat /etc/issue | grep -o -P ^Debian` = "Debian" ]]; then
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
elif [[ `cat /etc/issue | grep -o -P ^Ubuntu` = "Ubuntu" ]]; then
  let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
  let secs=$((${upSeconds}%60))
  let mins=$((${upSeconds}/60%60))
  let hours=$((${upSeconds}/3600%24))
  let days=$((${upSeconds}/86400))
  UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
  # get the load averages
  read one five fifteen rest < /proc/loadavg


  echo "
                          .oyhhs:    `date +"%A, %e %B %Y, %r"`
                 ..  .., shhhhhh-    `uname -srmo`
               -+++++++++\`:yyhhyo\`   Uptime            : ${UPTIME}
          .--  -++++++++/-.-::-\`     Memory Free/Total : `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB
        .::::-   :-----:/+++/++/.    Load Averages     : ${one} ${five} ${fifteen}
       -:::::-.          .:++++++:   Processes         : `ps aux | wc -l | tr -d ' '`
  ,,, .:::::-\`             .++++++-  Local IP          : `/sbin/ifconfig eth0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1`
./+++/-\`-::-                ./////:  Weather Edinburgh : `curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|UK|UK001|EDINBURGH|' | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
+++++++ .::-
./+++/-\`-::-                :yyyyyo
  \`\`\` \`-::::-\`             :yhhhhh:
       -:::::-.         \`-ohhhhhh+
        .::::-\` -o+///+oyhhyyyhy:
        \`.--   /yhhhhhhhy+,....
               /hhhhhhhhh-.-:::;
               \`.:://::- -:::::;
                         \`.-:-\'"
else
  echo "Welcome $USER!"
fi
fi

CCACHE_DIR=$HOME/dev/.ccache
PATH=/usr/lib/ccache:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
