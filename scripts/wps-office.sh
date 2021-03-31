#!/bin/sh

if [ ! -d /home/$(logname)/Reports ]; then
    mkdir /home/$(logname)/Reports
fi

sudo chown -R 1000 /home/$(logname)/Reports
sudo chmod +x /home/$(logname)/Reports/*

DIR=/home/$(logname)/Reports

# wget output file
FILE=wps-office.deb

# wget log file
LOGFILE=wget.log

# wget download url
URL=https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9719/wps-office_11.1.0.9719.XA_amd64.deb

cd $DIR
wget $URL -O $FILE -o $LOGFILE

rm $FILE
