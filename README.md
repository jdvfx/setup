# some of this is old
`> need to update with GNU Stow, Alacritty and Nvim+LUA config `

Auto-config bash script to be run after a clean Ubuntu 20.04 Minimal or Manjaro install
should also work with a regular install of Ubuntu 20.04, 20.10 or any Arch based distro

--- What the script does:

- remove SNAP package manager (if Ubuntu)
- install some packages (or Arch equivalent):
curl git firefox htop feh neovim xmonad libghc-xmonad-contrib-dev xmobar
dmenu build-essential gnome-disk-utility scrot spotify-client
autoconf libssl-dev apt-transport-https brave-browser

- download > build > install: suckless ST terminal
- install Plug for Neovim
- configure xmonad, xmobar, neovim, bashrc

one of my git repo is private (jdvfx/autoconf-ubu20.04)
so some of the commands will fail and be ignored.
they are marked with: -- private --

![xmonad desktop](https://github.com/jdvfx/setup/blob/master/xmonad_screenshot.png)

