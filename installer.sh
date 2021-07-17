echo "Installing needed programs"
sudo pacman -S awesome picom plank fish flameshot alacritty rofi

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

echo "Installing SF Mono"
sudo cp ./fonts/sfmono/* /usr/share/fonts/

echo "Copying config files"
cp -r ./awesome ~/.config
cp -r ./fish ~/.config
cp -r ./alacritty ~/.config

cp ./picom.conf ~/picom.conf
