# Ubuntu welcome

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
}
