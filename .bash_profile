export PS1="\n\u@\h\w$ "

export TERM="xterm-color"

shopt -s histappend
shopt -s checkwinsize

force_color_prompt=yes

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi



##
# Your previous /Users/neuralsandwich/.bash_profile file was backed up as /Users/neuralsandwich/.bash_profile.macports-saved_2012-03-26_at_13:57:48
##

# MacPorts Installer addition on 2012-03-26_at_13:57:48: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=~/.bin:$PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
# Added by install_latest_perl_osx.pl
[ -r /Users/neuralsandwich/.bashrc ] && source /Users/neuralsandwich/.bashrc

##
# Your previous /Users/neuralsandwich/.bash_profile file was backed up as /Users/neuralsandwich/.bash_profile.macports-saved_2012-08-03_at_20:35:18
##

# MacPorts Installer addition on 2012-08-03_at_20:35:18: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

