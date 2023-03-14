#!/bin/bash


#-- Reflector
country=Germany     # Beschreibung Land

#-- Aur Help
aur_help=yay     # Welchen AUR-Helper? Es gibt: paru, yay


#-- AUR - Help
git clone https://aur.archlinux.org/$aur_helper.git
cd $aur_help
makepkg -si --noconfirm


#-- Reflector
reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

#-- Tools
pacman -Sy --noconfirm neofetch

##-- Service --####
#>>Bluetooth
pacman -Sy --needed --noconfirm bluez bluez-utils blueman

#>>Print
pacman -Sy --needed --noconfirm cups cups-pdf cups-filters cups-pk-helper

#>>Sound
pacman -Sy --needed --noconfirm alsa alsa-utils pulseaudio pulseaudio-bluetooth pulseaudio-alsa pulseaudio-jack pulseaudio-equalizer

#>> Firewall
#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload

#-- System Enable / Disable
systemctl enable bluetooth.service
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable reflector.timer
systemctl enable reflector.service
