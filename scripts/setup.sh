#!/usr/bin/env bash

echo "Pacman NOCONFIRM"
sudo pacman -S neovim xclip mpv ffmpeg alsa-utils qutebrowser xorg-server xorg-xinit libx11 libxinerama libxft libxrandr xf86-video-intel mesa ttf-jetbrains-mono noto-fonts-cjk feh wget pass gnupg openssh yt-dlp git stow man-db --noconfirm

echo "MKDIR"
mkdir -p $HOME/personal/builds
mkdir -p $HOME/personal/bin
export BUILDS="$HOME/personal/builds"
mkdir $XDG_CONFIG_HOME/nvim $XDG_CONFIG_HOME/mpv $XDG_CONFIG_HOME/qutebrowser

echo "GIT CLONE BUILDS"
git clone git://git.suckless.org/dmenu $BUILDS/dmenu
git clone git://git.suckless.org/st $BUILDS/st
git clone git://git.suckless.org/dwm $BUILDS/dwm

echo "SED SUCKLESS"
cp $BUILDS/dmenu/config.def.h $BUILDS/dmenu/config.h 
sed -i '7s/monospace:size=10/JetBrains Mono:size=12/' $BUILDS/dmenu/config.h
cp $BUILDS/st/config.def.h $BUILDS/st/config.h 
sed -i '8s/Liberation Mono:pixelsize=12/JetBrains Mono:pixelsize=20/' $BUILDS/st/config.h
cp $BUILDS/dwm/config.def.h $BUILDS/dwm/config.h 
sed -i '6,7s/1/0/' $BUILDS/dwm/config.h
sed -i '8,9s/monospace:size=10/JetBrains Mono:size=12/' $BUILDS/dwm/config.h
sed -i '30s/Gimp/NULL/' $BUILDS/dwm/config.h
sed -i '30s/1/False/' $BUILDS/dwm/config.h
sed -i '31d' $BUILDS/dwm/config.h
sed -i '47s/Mod1Mask/Mod4Mask/' $BUILDS/dwm/config.h

echo "MAKE SUCKLESS"
sudo -v
cd $BUILDS/dmenu && sudo make clean install 
cd $BUILDS/st && sudo make clean install
cd $BUILDS/dwm && sudo make clean install

echo "YAY"
git clone https://aur.archlinux.org/yay.git $BUILDS/yay
cd $BUILDS/yay $$ makepkg -sic

echo "DOT"
rm $HOME/.bashrc
git clone https://github.com/pat-moreno/dot $HOME/dot
cd $HOME/dot && stow --ignore='^scripts$' .


