#!/bin/bash


#-- Reflector
country=Germany     # Beschreibung Land

#-- Aur Help
aur_help=yay     # Welchen AUR-Helper? Es gibt: paru, yay


#-- AUR - Help
git clone https://aur.archlinux.org/$aur_help.git
cd $aur_help
makepkg -si --noconfirm

$aur_help -S --noconfirm paru


#-- Reflector
reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

#-- Tools
sudo pacman -S gparted
sudo pacman -S htop
sudo pacman -S geany
sudo pacman -S gnome-boxes
sudo pacman -S gnome-disk-utility
sudo pacman -Sy --noconfirm neofetch
sudo pacman -S tilix
sudo pacman -Sy --noconfirm unzip
sudo pacman -Sy --noconfirm vim

#-- Mail
sudo pacman -S thunderbird

#-- Office
sudo pacman -S libreoffice-fresh libreoffice-fresh-de
sudo pacman -S hunspell hunspell-de
sudo pacman -S hyphen hyphen-de
sudo pacman -S libmythes mythes-de

#-- FileManager
sudo pacman -S nemo
sudo pacman -S cinnamon-translations


#-- Internet
sudo pacman -Sy --noconfirm firefox
sudo pacman -S filezilla
sudo pacman -S torbrowser-launcher
sudo pacman -S google-chrome

##-- Service --####
#>>Bluetooth
sudo pacman -Sy --needed --noconfirm bluez bluez-utils blueman

#>>Print
sudo pacman -Sy --needed --noconfirm cups cups-pdf cups-filters cups-pk-helper

#>>Sound
sudo pacman -Sy --needed --noconfirm alsa alsa-utils pulseaudio pulseaudio-bluetooth pulseaudio-alsa pulseaudio-jack pulseaudio-equalizer

#>> Firewall
#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload

#-- System Enable / Disable
sudo systemctl enable bluetooth.service
sudo systemctl enable bluetooth
sudo systemctl enable cups.service
sudo systemctl enable reflector.timer
sudo systemctl enable reflector.service

#--Clean unused files
pacman -Scc --noconfirm


/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot


