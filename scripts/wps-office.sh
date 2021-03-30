#!/bin/bash

cd && wget -O wps-office.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9719/wps-office_11.1.0.9719.XA_amd64.deb
sudo chmod 777 /home/$(logname)/wps-office.deb
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cp -p /home/$(logname)/Bullseye_Box/scripts/install_missing_wps_fonts.sh /home/$(logname)/.scripts
cd /home/$(logname)/.scripts
sudo ./install_missing_wps_fonts.sh