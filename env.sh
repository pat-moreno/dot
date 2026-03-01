#!/usr/bin/env bash

mkdir -p $HOME/personal/builds
mkdir -p $HOME/personal/bin
export BUILDS="$HOME/personal/builds"
mkdir -p $HOME/.config/nvim 

sudo -v

git clone git://git.suckless.org/dmenu $BUILDS/dmenu
git clone git://git.suckless.org/st $BUILDS/st
git clone git://git.suckless.org/dwm $BUILDS/dwm


cd $HOME 

sudo pacman -S neovim xclip cmus mpv ffmpeg alsa-utils xorg-server xorg-xinit xf86-video-intel noto-fonts-cjk noto-fonts pass gnupg openssh yt-dlp stow tmux libxinerama --noconfirm

rm .bashrc
rm .bash_profile
cd $HOME/dot && stow .

cd $BUILDS/st && cp config.def.h config.h
patch < patch-st.diff
cd $BUILDS/dwm && cp config.def.h config.h
patch < patch-dwm.diff
cd $BUILDS/dmenu && cp config.def.h config.h
patch < patch-dmenu.diff

cd $HOME

cd $BUILDS/dmenu && sudo make clean install 
cd $BUILDS/st && sudo make clean install
cd $BUILDS/dwm && sudo make clean install

sudo -K
