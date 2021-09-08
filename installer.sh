echo "Are you sure to install? (y/n)"
read option
if [ "$option" != "y" ]; then
	exit 1
fi

echo "Wanna make backups? (y/n) BACKUPS ARE STILL IN BETA"
read backup_option
if [ "$backup_option" == "y" ]; then
	echo "Backing Up Files"
	echo "Moving ~/.config/awesome to ~/.config/awesome.old"
	mv ~/.config/awesome ~/.config/awesome.old
	echo "Moving ~/.zshrc to ~/.zshrc.old"
	mv ~/.zshrc ~/.zshrc.old
	echo "Moving ~/.config/alacritty to ~/.config/alacritty.old"
	mv ~/.config/alacritty ~/.config/alacritty.old
	echo "Moving ~/.config/rofi to ~/.config/rofi.old"
	mv ~/.config/rofi ~/.config/rofi.old
	echo "Moving ~/.config/picom to ~/.config/picom.old"
	mv ~/.config/picom ~/.config/picom.old
	echo "Moving ~/.config/starship.toml to ~/.config/starship.toml.old"
	mv ~/.config/starship.toml ~/.config/starship.toml.old
fi

echo "Backing Up Files"
echo "Moving ~/.config/awesome to ~/.config/awesome.old"
mv ~/.config/awesome ~/.config/awesome.old
echo "Moving ~/.zshrc to ~/.zshrc.old"
mv ~/.zshrc ~/.zshrc.old
echo "Moving ~/.config/alacritty to ~/.config/alacritty.old"
mv ~/.config/alacritty ~/.config/alacritty.old
echo "Moving ~/.config/rofi to ~/.config/rofi.old"
mv ~/.config/rofi ~/.config/rofi.old
echo "Moving ~/.config/picom to ~/.config/picom.old"
mv ~/.config/picom ~/.config/picom.old
echo "Moving ~/.config/starship.toml to ~/.config/starship.toml.old"
mv ~/.config/starship.toml ~/.config/starship.toml.old

echo "Installing needed programs"
sudo pacman -Syu awesome plank zsh flameshot alacritty rofi cowsay fortune-mod networkmanager network-manager-applet inkscape brightnessctl kitty noto-fonts-emoji
yay -S xgetres paru picom-ibhagwan-git

echo "Installing OMZ"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing starship prompt"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Installing Custom Theme"
cp .Xresources ../

echo "Installing Fonts"
sudo cp ./fonts/sfmono/* /usr/share/fonts/
sudo cp ./fonts/agave/* /usr/share/fonts/
sudo cp ./local.conf /etc/fonts/

echo "Copying config files"
cp -r ./awesome ~/.config
cp ./zsh/* ~/
cp -r ./alacritty ~/.config
cp -r ./rofi ~/.config
cp -r ./picom ~/.config
cp ./starship.toml ~/.config/
