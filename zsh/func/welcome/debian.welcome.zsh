# Debian Welcome

function welcome() {
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
}
