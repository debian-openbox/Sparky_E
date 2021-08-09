## **Sparky_E** (instructions in Serbian)
### *Sparky Linux sa OpenBox WM*

1. Potrebno je prvo skinuti sa sajta https://sparkylinux.org/download/rolling/ ISO instalacioni fajl:
    * MinimalGUI https://distrowatch.com/dwres/torrents/sparkylinux-2021.06-x86_64-minimalcli.iso.torrent  

1. Pomoću Rufusa ili Etchera napraviti butabilni instalacioni USB Flash 
1. Instalirati na odabranu particiju
1. ažuriranje softvera  
_` sudo apt update && sudo apt full-upgrade`_
1. instaliranje git-a  
_`sudo apt install git`_
1. kloniranje git repozitorijuma Sparky_E  
_`git clone https://github.com/debian-openbox/Sparky_E.git`_
1. promena aktivnog direktorijuma  
_`cd Sparky_E`_
1. maksimalno podizanje ovlašćenja pristupa repozitorijumu Sparky_E rekurzivno  
_`sudo chmod --recursive 755 .`_
1. promena aktivnog direktorijuma  
_`cd scripts`_
1. Startovanje skripte _Sparky_E.sh_  
_`sudo ./Sparky_E.sh`_
1. Restart  
_`sudo reboot`_
1. Posle restarta potrebno je u konfiguracionim fajlovima **ncmpcpp** (_`~/.mpd/mpd.conf`_ i _`~/.ncmpcpp/config`_)  
promeniti putanju foldera sa muzikom ili ostaviti po default-u (_`~/Music`_):  
_`sudo geany ~/.mpd/mpd.conf`_  
_`sudo geany ~/.ncmpcpp/config`_  
_`sudo reboot`_

## AKO SE INSTALIRA U VIRTUALBOX-u
* potrebno je u tački 6. pre restarta instalirati GuestAdditions iz konzole (TTY):  
https://youtu.be/CwQ8XzP-h4Q?list=PL7ygF5ucclBQgWy6VruCjggBEXZxOcnxz
* Dodati user-a grupi vboxsf (za šerovanje fajlova sa HOST-om)  
_`sudo adduser $USER vboxsf`_
* dalje je isto od tačke 7. do kraja

