# execute as super user: $su

echo 'deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free
deb http://deb.debian.org/debian-security bullseye/updates main contrib non-free
deb-src http://deb.debian.org/debian-security bullseye/updates main contrib non-free
deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free' > sources.list

cp /etc/apt/sources.list /etc/apt/sources.list_backup
cp sources.list /etc/apt/sources.list
rm sources.list

apt update
apt upgrade

INSTALL_PKGS="
    git stow
    "

echo ">>>installing packages:"
echo $INSTALL_PKGS
sleep 2
for i in $INSTALL_PKGS; do
  apt install -y $i
done


echo -e ">>> GIT clone :Bunker dotfiles, Autoconf, Wallpapers"
sleep 2
mkdir ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu, st
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
cp -r ~/Desktop/gitclones/dotfiles/xmonad/dot_local_slash_bin/ ~/.local/bin/

echo ">>> Xmobar Config"
sleep 2
cp ~/Desktop/gitclones/dotfiles/xmobar/.xmobarrc ~/

#echo ">>> ST Config, build, install"
#sleep 2
#cp ~/Desktop/gitclones/dotfiles/st/* ~/Desktop/gitclones/st/
#cd ~/Desktop/gitclones/st/
#sudo make
#Esudo make install
echo "install Alacritty"
sleep 2
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty

echo ">>> Alacritty Config"
sleep 2
mkdir ~/.config/alacritty
cp ~/Desktop/gitclones/dotfiles/alacritty/* ~/.config/alacritty


# -- private --
echo ">>> set wallpaper"
sleep 2
cd ~/Desktop/gitclones/autoconf-ubu20.04
bash setwallpaper.sh



# set wallpaper
echo "set wallpaper"
sleep 2
nitrogen --set-zoom-fill `ls --color=never ~/Desktop/gitclones/wallpapers/* | tail -1`

# create screenshots dir for scrot
mkdir ~/Pictures/screenshots

echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"

