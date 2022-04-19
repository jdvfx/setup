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
    git stow kitty nitrogen feh
    "

echo ">>>installing packages:"
echo $INSTALL_PKGS
sleep 2
for i in $INSTALL_PKGS; do
  apt install -y $i
done


echo -e ">>> git clone and stow: dotfiles, wallpaper"
sleep 2
mkdir -p ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu, kitty
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/wallpapers.git
stow -t ~ kitty nvim xmobar xmonad
mv ~/Desktop/gitclones/wallpapers/ ~/Desktop/

# set wallpaper (use the first png in the folder)
# one of those 2 lines should work: need to test on real hardware though, VM doesn't work
#ls ~/Desktop/wallpapers/*.png | tail -1 | xargs -I % sh -c 'feh --bg-fill %'
#nitrogen --set-zoom-fill `ls --color=never ~/Desktop/wallpapers/*.png | tail -1`


echo ">>> copy bashrc and update"
sleep 2
cp ~/Desktop/gitclones/dotfiles/bashrc/.bashrc_bunker ~/
# add one line to the bashrc
echo "source ~/.bashrc_bunker" >> ~/.bashrc
# create dummy private bashrc (real one isn't on github)
touch ~/.bashrc_pr
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



# install neovim nightly
mkdir -p ~/Desktop/installs/neovim_nightly
cd ~/Desktop/installs/neovim_nightly
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
apt install ./nvim-linux64.deb
# update plugins
nvim -c ':PackerSync'

# create screenshots dir for scrot
mkdir ~/Pictures/screenshots

echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"

