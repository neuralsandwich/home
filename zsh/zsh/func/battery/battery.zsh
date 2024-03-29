###########################################
# Battery plugin for oh-my-zsh            #
# Original Author: Peter hoeg (peterhoeg) #
# Email: peter@speartail.com              #
###########################################
# Author: Sean Jones (neuralsandwich)     #
# Email: neuralsandwich@gmail.com         #
# Modified to add support for Apple Mac   #
###########################################

if [[ $(uname) == "Darwin" ]] ; then
    function battery_pct_remaining() {
	if [[ $(ioreg -rc AppleSmartBattery | grep -c '^.*"ExternalConnected"\ =\ No') -eq 1 ]] ; then
	    typeset -F maxcapacity=$(ioreg -rc "AppleSmartBattery"| grep '^.*"DesignCapacity"\ =\ ' | sed -e 's/^.*"DesignCapacity"\ =\ //')
	    typeset -F currentcapacity=$(ioreg -rc "AppleSmartBattery"| grep '^.*"AppleRawCurrentCapacity"\ =\ ' | sed -e 's/^.*AppleRawCurrentCapacity"\ =\ //')
	    integer i=$(((currentcapacity/maxcapacity) * 100))
	    echo $i
	else
	    echo "∞"
	fi
    }

    function battery_time_remaining() {
	if [[ $(ioreg -rc AppleSmartBattery | grep -c '^.*"ExternalConnected"\ =\ No') -eq 1 ]] ; then
	    timeremaining=$(ioreg -rc "AppleSmartBattery"| grep '^.*"AvgTimeToEmpty"\ =\ ' | sed -e 's/^.*"AvgTimeToEmpty"\ =\ //')
	    echo "~$((timeremaining / 60)):$((timeremaining % 60))"
	fi
    }

    function battery_pct_prompt () {
	if [[ $(ioreg -rc AppleSmartBattery | grep -c '^.*"ExternalConnected"\ =\ No') -eq 1 ]] ; then
	    b=$(battery_pct_remaining)
	    if [ $b -gt 50 ] ; then
		color='green'
	    elif [ $b -gt 20 ] ; then
		color='yellow'
	    else
		color='red'
	    fi
	    echo "%{$fg[$color]%}[$(battery_pct_remaining)%%]%{$reset_color%}"
	else
	    echo "∞"
	fi
    }

elif [[ $(uname) == "Linux"  ]] ; then
    if [[ $(which acpi) != "acpi not found" ]] ; then
	function battery_pct_remaining() {
	    if [[ $(acpi 2&>/dev/null | grep -c '^Battery.*Discharging') -gt 0 ]] ; then
		echo "$(acpi | cut -f2 -d ',' | tr -cd '[:digit:]')"
	    fi
	}

	function battery_time_remaining() {
	    if [[ $(acpi 2&>/dev/null | grep -c '^Battery.*Discharging') -gt 0 ]] ; then
		echo $(acpi | cut -f3 -d ',')
	    fi
	}

	function battery_pct_prompt() {
	    b=$(battery_pct_remaining)
	    if [[ $(acpi 2&>/dev/null | grep -c '^Battery.*Discharging') -gt 0 ]] ; then
		if [ $b -gt 50 ] ; then
		    color='green'
		elif [ $b -gt 20 ] ; then
		    color='yellow'
		else
		    color='red'
		fi
		echo "%{$fg[$color]%}[$(battery_pct_remaining)%%]%{$reset_color%}"
	    else
		echo "∞"
	    fi
	}
      else
        battery_pct_remaining(){}
        battery_time_remaining(){}
        battery_pct_prompt(){}
      fi
else
    echo "$fg[red]acpi is not installed$reset_color"

    battery_time_remaining(){ echo "no power monitor"}
    battery_pct_prompt(){}
fi
