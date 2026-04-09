#!/bin/sh

# .config
cd /home/antonio/repos/flake_desktop/dot_config
cp -r /home/antonio/.config/hypr .
cp -r /home/antonio/.config/kitty .
cp -r /home/antonio/.config/waybar .
cp -r /home/antonio/.config/fish .

# ~
cd /home/antonio/repos/flake_desktop/dots
cp /home/antonio/.bashrc .
cp /home/antonio/.gitconfig .
cp /home/antonio/.vimrc .
cp /home/antonio/.wezterm.lua .
cp /home/antonio/.gemini/trustedFolders.json ./.gemini/
cp /home/antonio/.gemini/settings.json ./.gemini/


