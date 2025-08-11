echo ### Fedora 42 setup (Onyx) ###
echo
read -p "> disable bluetooth"
systemctl stop bluetooth.service
systemctl stop bluetooth.target
systemctl disable bluetooth.service
systemctl disable bluetooth.target

# packages already included: 
# libreoffice git firefox gnome-disks boxes
#
read -p "> update Sway for Nvidia GPU"
sudo cp sway.desktop /usr/share/wayland-sessions/

PACKAGES="sway wl-clipboard wev wdisplays htop xkill alacritty stow imv lm_sensors"
read -p "> install packages: $PACKAGES"
sudo dnf install $PACKAGES

read -p "> install multimedia codecs"
sudo dnf group install multimedia

read -p "> install Brave browser"
sudo dnf install dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf install brave-browser

read -p "> clone GIT repos: dotfiles,setup,wallpapers"
cd ~/Desktop
mkdir -p git
cd git
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/setup.git
git clone https://github.com/jdvfx/wallpapers.git

read -p "> installing some fonts"
# default system font is: "Noto Sans" "Regular" (fc-match System-UI)
bash setup/fonts/install-fonts.sh

read -p "> Stow alacritty,nvim,tofi"
cd ~/Desktop/git/dotfiles
stow -t ~ nvim
stow -t ~ alacritty
stow -t ~ tofi

read -p "> copy bashrc"
cp ~/Desktop/git/dotfiles/bashrc/.bashrc_bunker ~/

read -p "> install Neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

echo
echo ">>> Fedora setup done <<<"
