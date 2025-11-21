sudo pacmman -Syu 
sudo pacman -S git base-devel gnome gnome-tweaks firefox
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S librewolf-bin

git clone https://github.com/vinceliuice/MacTahoe-gtk-theme.git
git clone https://github.com/vinceliuice/MacTahoe-icon-theme.git
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git

cd MacTahoe-gtk-theme
./install.sh -l --shell -i apple 
sudo ./tweaks.sh -f --gdm
cd MacTahoe-icon-theme 
./install.sh 
cd WhiteSur-wallpapers
./install.sh
cd San-Francisco-Pro-Fonts
nautilus . &
echo "you need to open all of these fonts with gnome-fonts and install"

echo "now apply all the themes"
gnome-tweaks &

echo "Do You want to Reboot Yy/Nn"
read ans

echo "cleaning up"
yay -Sc
yay -Yc
sudo pacman -Rns firefox


if [[ $ans == "y" ]]; then
  echo "blowing up pc in 3. 2. 1."
  sleep 1 
  reboot
elif [[ $ans == "Y" ]]; then
  echo "blowing up pc in 3. 2. 1."
  sleep 1 
  reboot
else
  echo "not rebooting"
fi


