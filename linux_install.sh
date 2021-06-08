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

INSTALL_PKGS="git firefox htop feh curl neovim xmonad libghc-xmonad-contrib-dev dmenu build-essential gnome-disk-utility xmobar scrot spotify-client autoconf libssl-dev gedit"
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
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/autoconf-ubu20.04.git
git clone http://git.suckless.org/st

echo ">>> copy bashrc and update"
sleep 2
cp ~/Desktop/gitclones/dotfiles/bashrc/.bashrc ~/
source ~/.bashrc

echo ">>> install fonts"
sleep 2
bash install_fonts.sh

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

echo ">>> set wallpaper"
sleep 2
cd ~/Desktop/gitclones/autoconf-ubu20.04
bash setwallpaper.sh

echo ">>> install Brave Browser"
sleep 2
bash install_brave.sh

#https://github.com/junegunn/vim-plug
echo "install vim plug"
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"


#logout and log back into xmonad (default shortcut is Alt+shift+Enter)

#copy .bashrc

# install JetBrains mono font

#install make

# install ST

#copy config.h into ST's directory
# compile ST
#sudo make 
#sudo make install


# inside Neovim:
#:PlugInstall


