#!/bin/sh

#Move into the .config folder
cd ~/.config

echo "Getting updates for console config"
echo "From Github.  Please wait."
git pull
echo "Everything should be up-to-date now ;)"
