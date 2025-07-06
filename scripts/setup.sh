#!/usr/bin/env bash

sudo -v

sudo pacman -S neovim xclip mpv ffmpeg alsa-utils qutebrowser

cd ~

git clone https://github.com/pat-moreno/dot && cd dot && stow --adopt --ignore='^scripts$' . && cd ~

mkdir -r personal/builds && cd personal/builds

git clone git://git.suckless.org/dmenu
cd dmenu && cp config.def.h config.h && sed -i '7s/monospace:size=10/JetBrains Mono:size=12/' config.h && cd ..
git clone git://git.suckless.org/st
cd st && cp config.def.h config.h && sed -i '8s/Liberation Mono:pixelsize=12/JetBrains Mono:pixelsize=20/' config.h && cd ..
git clone git://git.suckless.org/dwm
cd dwm && cp config.def.h config.h && sed -i 's/monospace:size=10/JetBrains Mono:size=12/g' -e '30s/Gimp/NULL/' -e '30s/1/False/' -e '31d' -e '47s/Mod1Mask/Mod4Mask/' config.h && cd ..

pacman -S xorg-server xorg-xinit libx11 libxinerama libxft libxrandr xf86-video-intel mesa ttf-jetbrains-mono noto-fonts-cjk 

cd dmenu && sudo make clean install 

cd ../st && sudo make clean install

cd ../dwm && sudo make clean install && cd ~

sudo pacman -S 7zip unzip tar wget pass gnupg openssh yt-dlp 

amixer sset Master unmute 75%

cd personal/builds && git clone https://aur.archlinux.org/youtube-viewer-git.git && cd youtube-viewer-git/ && makepkg -sic && cd ~



