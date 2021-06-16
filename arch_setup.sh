#!/bin/bash
#
# AutoConfig System
# run after Manjaro or Arch

# already installed with Manjaro xfce minimal
# htop, git

INSTALL_pacman_Manjaro="
    firefox feh neovim xmonad xmonad-contrib xmobar
    dmenu base-devel scrot spotifyd
    brave nitrogen gnome-disk-utility yay cheese alacritty xorg-xrandr python-pip
    "

INSTALL_yay_Manjaro="
    spotify nomachine
    "

#INSTALL_PKGS_pacman_Arch="
    #xorg xorg-xinit nvidia git htop
    #"

echo ">>>installing packages with pacman:"
sleep 2
sudo pacman -S $INSTALL_pacman_Manjaro

echo ">>>installing packages with yay:"
sleep 2
sudo yay -S $INSTALL_yay_Manjaro

echo -e ">>> GIT clone: Bunker dotfiles, Autoconf, Wallpapers"
sleep 2
mkdir ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu 
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/wallpapers.git

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

#https://github.com/junegunn/vim-plug
echo "install vim plug"
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


echo "upgrading pynvim for Semshi nvim plugin"
sleep 2
pip3 install pynvim --upgrade 


# set wallpaper
echo "set wallpaper"
sleep 2
nitrogen --set-zoom-fill `ls --color=never ~/Desktop/gitclones/wallpapers/* | tail -1`




echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"

#logout and log back into xmonad (default shortcut is Alt+shift+Enter)

