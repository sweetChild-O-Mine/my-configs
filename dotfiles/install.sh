echo "Installling dotfiles...."

#create directories
mkdir -p ~/.config/{i3,polyar,rofi,alacritty}
mkdir -p ~/.i3/scripts

#copy configs
cp -r dotfiles/i3/* ~/.config/i3/
cp -r dotfiles/polybar/* ~/.config/polybar/material
cp -r dotfiles/scripts/* ~/.i3/scripts/

# make scripts executable 
chmod +x ~/.i3/scripts/*.sh
chmod +x ~/.config/polybar/material/scripts/*.sh

# install dependencies
echo "Installing dependencies..."
sudo apt update
sudo apt install -y polybar rofi feh imagemagick dunst i3

echo "dotfiles installed!!! restart i3. :)"




