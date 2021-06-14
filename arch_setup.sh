#!/bin/bash
#
# AutoConfig System
# run after Manjaro or Arch
#

# already installed with Manjaro xfce minimal
# htop, git

INSTALL_PKGS_Manjaro="
    firefox feh neovim xmonad xmonad-contrib xmobar
    dmenu base-devel scrot spotifyd
    brave nitrogen gnome-disk-utility yay cheese
    "

INSTALL_PKGS_base_Arch="
    xorg xorg-xinit nvidia git htop
    "

echo ">>>installing packages:"
sleep 2
sudo pacman -S $INSTALL_PKGS_Manjaro
#sudo pacman -S $INSTALL_PKGS_base_Arch

echo -e ">>> GIT clone \nSuckless ST, Bunker dotfiles & Autoconf"
sleep 2
mkdir ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu, st 
git clone https://github.com/jdvfx/dotfiles.git
git clone http://git.suckless.org/st
git clone https://github.com/jdvfx/wallpapers.git

#echo "installing spotify client"
#sleep 2
#git clone https://aur.archlinux.org/spotify.git
# makepkg -si

# -- private --
# for custom versions of Nomachine, openFortiVPN, 
# lightweight JetBrains mono font package, wallpaper
#git clone https://github.com/jdvfx/autoconf-ubu20.04.git

echo ">>> copy bashrc and update"
sleep 2
cp ~/Desktop/gitclones/dotfiles/bashrc/.bashrc_bunker ~/
# add one line to the bashrc
echo "source ~/.bashrc_bunker" >> ~/.bashrc
source ~/.bashrc
 
echo ">>> install fonts"
sleep 2
cd ~/Desktop/gitclones/
mkdir fonts
cd fonts
curl -LO https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.3/JetBrainsMono-1.0.3.zip
unzip *.zip
cd `ls --color=never -I *.zip`
mv ttf JetBrainsMono
sudo cp -r JetBrainsMono /usr/share/fonts/truetype/
fc-cache -vf



## -- private --
#echo ">>> install Nomachine and OpenFortiVPN"
#sleep 2
#bash install_nomachine_and_openfortivpn.sh

echo ">>> Neovim Config"
sleep 2
mkdir ~/.config/nvim
cp ~/Desktop/gitclones/dotfiles/nvim/* ~/.config/nvim/

echo ">>> Xmonad Config"
sleep 2
mkdir ~/.xmonad/
cp -r ~/Desktop/gitclones/dotfiles/xmonad/* ~/.xmonad/
mkdir ~/.local/bin/
cp -r ~/Desktop/gitclones/dotfiles/xmonad/dot_local_slash_bin/* ~/.local/bin/

echo ">>> Xmobar Config"
sleep 2
cp ~/Desktop/gitclones/dotfiles/xmobar/.xmobarrc ~/

echo ">>> ST Config, build, install"
sleep 2
cp ~/Desktop/gitclones/dotfiles/st/* ~/Desktop/gitclones/st/
cd ~/Desktop/gitclones/st/
sudo make
sudo make install

## -- private --
#echo ">>> set wallpaper"
#sleep 2
#cd ~/Desktop/gitclones/autoconf-ubu20.04
#bash setwallpaper.sh

#https://github.com/junegunn/vim-plug
echo "install vim plug"
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#


echo "install nomachine"
sleep 2
yay -S nomachine


# set wallpaper
echo "set wallpaper"
sleep 2
nitrogen --set-zoom-fill `ls --color=never ~/Desktop/gitclones/wallpapers/* | tail -1`

echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"

#logout and log back into xmonad (default shortcut is Alt+shift+Enter)

