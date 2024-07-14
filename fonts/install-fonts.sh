unzip \*.zip
sudo mkdir -p /usr/share/fonts/opentype/
sudo cp -r cartograph cascadia /usr/share/fonts/opentype/
fc-cache -vf

