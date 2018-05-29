# Mac OS X Welcome

function welcome() {
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
}
