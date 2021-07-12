echo "Installing needed programs"
sudo pacman -S awesome picom plank fish flameshot alacritty

echo "Installing starship prompt"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Which theme do you want to install?"
echo "(1) dracula"

read theme

if [ "$theme" = "1" ]
do
	cp ./dracula/.Xresources ~/
done

echo "Copying config files"
cp -r ./awesome ~/.config
cp -r ./fish ~/.config
cp -r ./alacritty ~/.config
