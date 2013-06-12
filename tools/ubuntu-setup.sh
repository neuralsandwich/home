#!/bin/sh

# List of programs I am found of
INSTALL_LIST = "htop zsh git vim curl acpi vlc skype build-essential rails tmux"

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
