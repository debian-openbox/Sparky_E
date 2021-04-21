#!/bin/bash
#
# Writes sources.list in order to add non-free repository

echo "# deb http://http.debian.net/debian $DEBIAN_RELEASE main" > /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb http://http.debian.net/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://http.debian.net/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb http://security.debian.org/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "# $DEBIAN_RELEASE-updates, previously known as "volatile"" >> /etc/apt/sources.list
echo "deb http://http.debian.net/debian bullseye-security main" >> /etc/apt/sources.list
echo "deb-src http://http.debian.net/debian bullseye-security main" >> /etc/apt/sources.list
