#!/bin/sh

# List of programs I am found of
INSTALL_LIST = "htop zsh git curl acpi vlc skype build-essential rails libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial gedit-latex-plugin"

echo "Time to install stuff!!!"

# Install programs
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y $INSTALL_LIST

if [ `which google-chrome` != "/usr/bin/google-chrome" ] ; then
  echo "Installing chrome"
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "$HOME/Downloads/chrome.deb"
  sudo dpkg -i "$HOME/Downloads/chrome.deb"
  echo "Don't worry! apt-get to the rescue!"
  sudo apt-get -f -y
fi

echo "Lets install vim!.. From scratch"
cd "$HOME"
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim73
sudo make install
cd -

if [ "$SHELL" != "/usr/bin/zsh" ] ; then
  echo "What time is it? ZSH Time!"
  chsh -s `which zsh`
fi

if [ ! -e "$HOME/.dot" ] ; then
 echo "Need to grab my config files!"
 git clone "git@github.com:/NeuralSandwich/home.git" "$HOME/.dot"
fi

echo "Getting rid of the goofy scrollbars!"
gsettings set com.canonical.desktop.interface scrollbar-mode normal

if [ -e !"$HOME/dev" ] ; then
  mkdir "$HOME/dev"
fi

vim +BundleInstall +qall
