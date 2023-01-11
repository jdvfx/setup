echo clone GIT repos dotfiles,setup,wallpapers.
cd ~/Desktop
mkdir git
cd git
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/setup.git
git clone https://github.com/jdvfx/wallpapers.git

echo install a FONT
sudo mkdir /usr/share/fonts/ibm_plex_mono
sudo cp ~/Desktop/git/setup/IBM_Plex_Mono.zip /usr/share/fonts/ibm_plex_mono/
cd /usr/share/fonts/ibm_plex_mono
sudo unzip IBM_Plex_Mono.zip
sudo rm IBM_Plex_Mono.zip
fc-cache -vf

echo STOW alacritty,nvim,xmonad,xmobar
cd ~/Desktop/git/dotfiles

rm xmobar/.xmobarrc
mv xmobar/xmobarrc_lenovo xmobar/.xmobarrc

stow -t ~ alacritty
stow -t ~ nvim
stow -t ~ xmonad
stow -t ~ xmobar


#cp ~/Desktop/git/dotfiles/bashrc/.bashrc_bunker ~/
