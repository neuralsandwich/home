# Welcome
#
## Welcome Message ##
if [ `uname -n` = "raspberrypi" ]; then
  source "$ZSH/func/welcome/raspberrypi.welcome.zsh"
elif [[ `uname` = "Darwin" ]] ; then
  source "$ZSH/func/welcome/macosx.welcome.zsh"
elif [[ `cat /etc/issue | grep -o -P ^Debian` = "Debian" ]]; then
  source "$ZSH/func/welcome/debian.welcome.zsh"
elif [[ `cat /etc/issue | grep -o -P ^Ubuntu` = "Ubuntu" ]]; then
  source "$ZSH/func/welcome/ubuntu.welcome.zsh"
elif [[ `cat /etc/issue | grep -o -P ^Arch` = "Arch" ]]; then
  source "$ZSH/func/welcome/arch.welcome.zsh"
elif [[ `cat /etc/issue | grep -o -P ^CentOS` = "CentOS" ]]; then
  source "$ZSH/func/welcome/centos.welcome.zsh"
else
  function welcome() {
    echo "Welcome $USER!"
  }
fi

# Call the welcome function!
welcome
