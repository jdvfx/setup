#!/bin/bash
#
# AutoConfig System
# run after Ubuntu 20.04 minimal, with XFCE minimal
#
# get rid of Snap
echo ">>> removing SNAP!"
sleep 2
sudo umount /var/snap
sudo apt purge snapd
# note: don't install chromnium browser (it will re-install snap)

echo ">>> adding SPOTIFY repo"
sleep 2
sudo apt-get install curl -y
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

echo ">>> adding Brave-Browser repo"
sleep 2
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo ">>> updating ..."
sleep 2
sudo apt update

INSTALL_PKGS="
    git firefox htop feh neovim xmonad libghc-xmonad-contrib-dev xmobar 
    dmenu build-essential gnome-disk-utility scrot spotify-client
    autoconf libssl-dev apt-transport-https brave-browser nitrogen cheese
    "

echo ">>>installing packages:"
echo $INSTALL_PKGS
sleep 2
for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done

echo -e ">>> GIT clone \nSuckless ST, Bunker dotfiles & Autoconf"
sleep 2
mkdir ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu, st 
git clone https://github.com/jdvfx/dotfiles.git
git clone http://git.suckless.org/st
git clone https://github.com/jdvfx/wallpapers.git


# -- private --
# for custom versions of Nomachine, openFortiVPN, 
# lightweight JetBrains mono font package, wallpaper
git clone https://github.com/jdvfx/autoconf-ubu20.04.git

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

# -- private --
echo ">>> install Nomachine and OpenFortiVPN"
sleep 2
bash install_nomachine_and_openfortivpn.sh

echo ">>> Neovim Config"
sleep 2
mkdir ~/.config/nvim
cp ~/Desktop/gitclones/dotfiles/nvim/* ~/.config/nvim/

echo ">>> Xmonad Config"
sleep 2
mkdir ~/.xmonad/
cp -r ~/Desktop/gitclones/dotfiles/xmonad/* ~/.xmonad/
cp -r ~/Desktop/gitclones/dotfiles/xmonad/dot_local_slash_bin/ ~/.local/bin/

echo ">>> Xmobar Config"
sleep 2
cp ~/Desktop/gitclones/dotfiles/xmobar/.xmobarrc ~/

echo ">>> ST Config, build, install"
sleep 2
cp ~/Desktop/gitclones/dotfiles/st/* ~/Desktop/gitclones/st/
cd ~/Desktop/gitclones/st/
sudo make
sudo make install

# -- private --
echo ">>> set wallpaper"
sleep 2
cd ~/Desktop/gitclones/autoconf-ubu20.04
bash setwallpaper.sh

#https://github.com/junegunn/vim-plug
echo "install vim plug"
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# set wallpaper
echo "set wallpaper"
sleep 2
nitrogen --set-zoom-fill `ls --color=never ~/Desktop/gitclones/wallpapers/* | tail -1`


echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"

#logout and log back into xmonad (default shortcut is Alt+shift+Enter)

