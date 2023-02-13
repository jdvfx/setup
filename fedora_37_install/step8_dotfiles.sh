# clone dotfiles repo, setup, wallpapers

echo clone GIT repos dotfiles,setup,wallpapers.
cd ~/Desktop
mkdir git
cd git
git clone https://github.com/jdvfx/dotfiles.git
git clone https://github.com/jdvfx/setup.git
git clone https://github.com/jdvfx/wallpapers.git

# TODO : check this on Fedora37
echo install terminal FONT (SF Mono)
sudo mkdir /usr/share/fonts/sf_mono
sudo cp ~/Desktop/git/setup/SF_Mono_font.zip /usr/share/fonts/sf_mono/
cd /usr/share/fonts/sf_mono
sudo unzip SF_Mono_font.zip
sudo rm SF_Mono_font.zip
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
