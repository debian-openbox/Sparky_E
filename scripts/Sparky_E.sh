#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts
sudo chmod -R 755 ~/.scripts

sudo chown -R $(logname):$(logname) /home/$(logname)/
find ~/Sparky_Box -type d -exec chmod 755 {} \;
find ~/Sparky_Box -type f -exec chmod 755 {} \;

echo "sleep 8 && /usr/bin/conky-session &" >> ~/.config/openbox/autostart.sh
echo "package-update-indicator &" >> ~/.config/openbox/autostart.sh
echo "compton -cC -i 0.85 -e 0.85 -m 0.9 -r 4 -l -4 -t -4 &" >> ~/.config/openbox/autostart.sh
echo "numlockx on &" >> ~/.config/openbox/autostart.sh
echo "~/keyboard.sh" >> ~/.config/openbox/autostart.sh
echo "fbxkb &" >> ~/.config/openbox/autostart.sh
echo "urxvtd -q &" >> ~/.config/openbox/autostart.sh

sudo apt-get update

sudo apt install -y  mpd ncmpcpp geany terminator rxvt-unicode nmap net-tools mpv vlc htop firefox-esrgnome-disk-utility python3-pip fonts-ubuntu fonts-ubuntu-console suckless-tools sxiv git wmctrl arc-theme oxygen-icon-theme psmisc flameshot package-update-indicator ttf-mscorefonts-installer && sudo apt install qbittorrent --no-install-recommends && sudo apt install pcmanfm-qt --no-install-recommends

mkdir ~/.config/

cp -Rp ~/Sparky_Box/.config/geany ~/.config
cp -Rp ~/Sparky_Box/.config/mpv ~/.config
cp -Rp ~/Sparky_Box/.config/tint2 ~/.config
cp -Rp ~/Sparky_Box/.config/compton.conf ~/.config
cp -Rp ~/Sparky_Box/.config/openbox/rc.xml ~/.config/openbox/
mkdir ~/.config/terminator
cp -Rp ~/Sparky_Box/.config/terminator/config ~/.config/terminator/
mkdir -p ~/.config/pcmanfm-qt/default
cp -Rp ~/Sparky_Box/.config/pcmanfm-qt/default/settings.conf ~/.config/pcmanfm-qt/default/
mkdir ~/.config/jgmenu
cp -Rp ~/Sparky_Box/.config/jgmenu/prepend.csv ~/.config/jgmenu/

cp -p ~/Sparky_Box/.Xresources ~/

cp -p ~/Sparky_Box/keyboard.sh ~/

sudo cp -p ~/Sparky_Box/rs.png /usr/share/fbxkb/images/rs.png

sudo cp ~/Sparky_Box/ncmpcpp_48x48.png /usr/share/icons

#sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

#sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Sparky_Box/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Sparky_Box/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Sparky_Box/start-compton.sh ~/bin
sudo chmod -R 755 ~/bin

## instalacija ncmpcpp
cp -Rp ~/Sparky_Box/.ncmpcpp ~/
cp -Rp ~/Sparky_Box/.mpd ~/
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
sudo echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp -p ~/Sparky_Box/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp -p ~/Sparky_Box/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
# cp -p ~/Sparky_Box/scripts/settings_geany ~/.scripts
# cd ~/.scripts
# sudo ./settings_geany

## obmenu-generator
cp -p ~/Sparky_Box/scripts/obmenu-generator.sh ~/.scripts

# mkdir ~/projects
# cd ~/projects
# git clone https://github.com/speja969/debian-openbox.git

# cd ~/projects/debian-openbox/10_openbox_terminator
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
# sudo ./install.sh

cd /home/$(logname)/Sparky_Box/scripts && sudo ./wps-office.sh
cd /home/$(logname)/Reports
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cd /home/$(logname)/Sparky_Box/scripts/
sudo ./install_missing_wps_fonts.sh

# dt-dark-theme
cp -pR /home/$(logname)/Sparky_Box/.themes /home/$(logname)/


# cd ~/projects/debian-openbox/10_openbox_conky
# sudo ./install.sh

# cd ~/projects/debian-openbox/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openbox/10_openbox_nomacs-viewer
# sudo ./install.sh
# sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openbox/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Sparky_Box/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Sparky_Box/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Sparky_Box/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

#sudo chmod --recursive 777 ~/.config

## setting default text editor
xdg-mime default pcmanfm-qt.desktop inode/directory


## settings htop.desktop & ranger.desktop files
#echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

#sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

#sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

#echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

#sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

#sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

mkdir -p ~/.urxvt/ext
cp -p ~/Sparky_Box/ext/* ~/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

# replace thunar with pcmanfm-qt
sed -i '/thunar --daemon &/c\pcmanfm --desktop &' ~/.config/openbox/autostart.sh

cd ~/Sparky_Box/scripts/openbox_conky
sudo ./install.sh

cd ~/Sparky_Box/scripts/install_vim/
sudo ./install.sh

#sudo chown -R $(logname):$(logname) /home/$(logname)/
#find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
#find /home/$(logname) -type f | xargs sudo chmod 700

