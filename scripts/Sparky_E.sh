#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts
sudo chmod -R 755 ~/.scripts

sudo chown -R $(logname):$(logname) /home/$(logname)/
find ~/Sparky_E -type d -exec chmod 755 {} \;
find ~/Sparky_E -type f -exec chmod 755 {} \;

sudo apt-get update

sudo apt install -y  mpd ncmpcpp geany terminator rxvt-unicode lxappearance nmap net-tools mpv vlc htop firefox-esr gnome-disk-utility python3-pip fonts-ubuntu fonts-ubuntu-console suckless-tools sxiv git wmctrl numlockx arc-theme oxygen-icon-theme psmisc flameshot qt5-style-plugins libglu1-mesa ttf-mscorefonts-installer && sudo apt install -y qbittorrent --no-install-recommends && sudo apt install -y pcmanfm-qt --no-install-recommends

# mkdir ~/.config/
echo "sleep 8 && /usr/bin/conky-session &" >> ~/.config/autostart.sh
echo "package-update-indicator &" >> ~/.config/autostart.sh
echo "compton -cC -i 0.85 -e 0.85 -m 0.9 -r 4 -l -4 -t -4 &" >> ~/.config/autostart.sh
echo "urxvtd -q &" >> ~/.config/autostart.sh

cp -Rp ~/Sparky_E/.config/gtk-3.0 ~/.config
cp -Rp ~/Sparky_E/.config/geany ~/.config
cp -Rp ~/Sparky_E/.config/mpv ~/.config
#cp -Rp ~/Sparky_E/.config/tint2 ~/.config
cp -Rp ~/Sparky_E/.config/compton.conf ~/.config
mkdir ~/.config/terminator
cp -Rp ~/Sparky_E/.config/terminator/config ~/.config/terminator/
mkdir -p ~/.config/pcmanfm-qt/default
cp -Rp ~/Sparky_E/.config/pcmanfm-qt/default/settings.conf ~/.config/pcmanfm-qt/default/

sudo sed -i 's!system-file-manager!/usr/share/icons/oxygen/base/64x64/apps/system-file-manager.png!' /home/peja/.local/share/applications/pcmanfm-qt.desktop

cp -Rp ~/Sparky_E/.e ~/
cp -Rp ~/Sparky_E/.elementary ~/

cp -p ~/Sparky_E/.Xresources ~/

sudo chown root:root ~/Sparky_E/ncmpcpp_48x48.png
sudo cp ~/Sparky_E/ncmpcpp_48x48.png /usr/share/icons

#sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png

sudo cp -p --recursive /home/$(logname)/Sparky_E/scripts/wingrid* /usr/local/bin/
sudo chmod a+x /usr/local/bin/wingrid*
mkdir /home/$(logname)/.config/wingrid
cp -p /home/$(logname)/Sparky_E/wingrid.conf /home/$(logname)/.config/wingrid/
sudo chmod a+x /usr/local/bin/wingrid*

# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

#sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Sparky_E/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Sparky_E/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Sparky_E/start-compton.sh ~/bin
sudo chmod -R 755 ~/bin

## instalacija ncmpcpp
cp -Rp ~/Sparky_E/.ncmpcpp ~/
cp -Rp ~/Sparky_E/.mpd ~/
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
sudo echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp -p ~/Sparky_E/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp -p ~/Sparky_E/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
# cp -p ~/Sparky_E/scripts/settings_geany ~/.scripts
# cd ~/.scripts
# sudo ./settings_geany

cd /home/$(logname)/Sparky_E/scripts && sudo ./wps-office.sh
cd /home/$(logname)/Reports
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cd /home/$(logname)/Sparky_E/scripts/
sudo ./install_missing_wps_fonts.sh

# E-themes
mkdir /home/$(logname)/.elementary/themes
cp -pR /home/$(logname)/Sparky_E/.themes/* /home/$(logname)/.elementary/themes/

# cd ~/projects/debian-openE/10_openE_conky
# sudo ./install.sh

# cd ~/projects/debian-openE/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openE/10_openE_nomacs-viewer
# sudo ./install.sh
# sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openE/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Sparky_E/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Sparky_E/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openE/15_openE_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openE/15_openE_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openE/15_openE_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openE/15_openE_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Sparky_E/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
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

mkdir -p /home/$(logname)/.urxvt/ext
cp -p /home/$(logname)/Sparky_E/ext/* /home/$(logname)/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

# replace thunar with pcmanfm-qt
sed -i '/thunar --daemon &/c\pcmanfm --desktop &' ~/.config/openE/autostart.sh

cd ~/Sparky_E/scripts/openE_conky
sudo ./install.sh

cd ~/Sparky_E/scripts/install_vim/
sudo ./install.sh

#sudo chown -R $(logname):$(logname) /home/$(logname)/
#find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
#find /home/$(logname) -type f | xargs sudo chmod 700

