#


# get rid of snap
echo ">>> removing SNAP!"
sleep 2
sudo umount /var/snap
sudo apt purge snapd
# note: don't install chromnium browser (it will re-install snap)
#in the menu, go to keyboard and remap xfce-popup-whiskermenu to "Super Key"

echo ">>> adding SPOTIFY repo"
sleep 2
sudo apt-get install curl -y
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

INSTALL_PKGS="git firefox htop feh curl neovim xmonad libghc-xmonad-contrib-dev dmenu build-essential gnome-disk-utility xmobar scrot spotify-client autoconf libssl-dev"
echo -e ">>>installing packages:"
echo $INSTALL_PKGS
sleep 2
for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done

echo -e ">>> GIT clone \nSuckless ST, Bunker dotfiles & Autoconf"
sleep 2
mkdir ~/Desktop/gitclones
cd ~/Desktop/gitclones/
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/autoconf-ubu20.04.git
git clone http://git.suckless.org/st



#logout and log back into xmonad (default shortcut is Alt+shift+Enter)

#copy .bashrc

# install JetBrains mono font

#install make

# install ST

#copy config.h into ST's directory
# compile ST
#sudo make 
#sudo make install

# install vim plug
#https://github.com/junegunn/vim-plug

# inside Neovim:
#:PlugInstall


