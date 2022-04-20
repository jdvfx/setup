# execute as super user: $su

read -p "> Adding non-free+contrib repos > update > upgrade
... Press a key to continue ... "

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

# packages to test on debian
# brave chrome
# nordvpn openfortivpn
# pdftoppm
# spotify


INSTALL_PKGS="
    git stow kitty nitrogen feh kdenlive audacity inkscape gimp gnome-disk-utility virt-manager transmission-gtk img2pdf
    "

echo "> installing packages:"
echo $INSTALL_PKGS
read -p "... Press a key to continue ..."

for i in $INSTALL_PKGS; do
  apt install -y $i
done

read -p ">>> git clone and stow: dotfiles, wallpaper, bashrc
... Press a key to continue ... "

mkdir -p ~/Desktop/gitclones
cd ~/Desktop/gitclones/
# bashrc, neovim, xmonad, xmobar, dmenu, kitty
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/wallpapers.git
cd dotfiles
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


read -p "> Installing Fonts (JetBrains Mono)
... Press a key to continue ... "

cd ~/Desktop/gitclones/
mkdir fonts
cd fonts
curl -LO https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.3/JetBrainsMono-1.0.3.zip
unzip *.zip
cd `ls --color=never -I *.zip`
mv ttf JetBrainsMono
cp -r JetBrainsMono /usr/share/fonts/truetype/
fc-cache -vf


read -p "> Installing Neovim nightly, Packer+Plugins, Rust, Cargo, rust-analyzer,
... Press a key to continue ... "

# install neovim nightly
mkdir -p ~/Desktop/installs/neovim_nightly
cd ~/Desktop/installs/neovim_nightly
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
apt install ./nvim-linux64.deb
# update plugins
nvim -c ':PackerSync'


# install languague servers
mkdir -p ~/Desktop/installs/lang_servers
# rust-analyzer
curl -LO https://github.com/rust-lang/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz
gunzip rust-analyzer-x86_64-unknown-linux-gnu.gz
mv rust-analyzer-x86_64-unknown-linux-gnu rust-analyzer
chmod +x rust-analyzer
cp rust-analyzer /usr/bin/

# install Rust compiler / cargo / clippy / rust-docs / rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env



# create screenshots dir for scrot
mkdir ~/Pictures/screenshots

echo " ##################"
echo " ### ALL DONE ! ###"
echo " ##################"


# packages versions on: 04/19/2022

# Audacity v2.4.2
# kdenlive 20.12.3
# nvim v0.8.0
# git version 2.30.2
# kitty 0.19.3
# xmonad
# xmobar
# dmenu
# python3 3.9.1
# gimp 2.10.22
# Inkscape 1.0.2
# cheese 3.38.0 (webcam app)
# gnome-disk-utility 3.38.2
# img2pdf 0.4.0
# transmission-gtk 3.00
# virt-manager 3.2.0

# nvidia-drivers 470. (need to check on physical hardware)



# >> pre-installed with Debian 11 xfce
# ffmpeg version 4.3.3-0
# atril 1.24 (pdf viewer)
# ImageMagick 6.9.11-60
# xsane 0.999

# >> optional:
# Blender 2.83.5


# ...................

#

