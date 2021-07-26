echo "Installing needed programs"
sudo pacman -Syu awesome picom plank fish flameshot alacritty rofi cowsay fortune-mod networkmanager network-manager-applet inkscape xorg-xbacklight kitty
yay -S xgetres

echo "Installing OMF"
curl -L https://get.oh-my.fish | fish

echo "Installing starship prompt"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Which theme do you want to install?"
echo "(1) dracula"

read theme

if [ "$theme" = "1" ]
then
	cp ./dracula/.Xresources ~/
fi

echo "Installing Fonts"
sudo cp ./fonts/sfmono/* /usr/share/fonts/
sudo cp ./fonts/agave/* /usr/share/fonts/
sudo cp ./local.conf /etc/fonts/

echo "Copying config files"
cp -r ./awesome ~/.config
cp -r ./fish ~/.config
cp -r ./alacritty ~/.config
cp -r ./rofi ~/.config
cp ./picom.conf ~/picom.conf
cp ./starship.toml ~/.config/
