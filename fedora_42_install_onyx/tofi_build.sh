echo --- Tofi: build and install ---
echo 
echo # Runtime dependencies
sudo dnf install freetype-devel cairo-devel pango-devel wayland-devel libxkbcommon-devel harfbuzz

echo # Build-time dependencies
sudo dnf install meson scdoc wayland-protocols-devel

git clone https://github.com/philj56/tofi.git
cd tofi
echo # Build and Install
meson build && ninja -C build install
cd ..
rm -rf tofi

