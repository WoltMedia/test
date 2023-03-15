#!/bin/bash


##--> INSTALLATIONSSCRIPT <--##

#-- Hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts


#-- Hardware Time
timedatectl set-ntp true
hwclock --systohc
timedatectl set-local-rtc 0


#-- Keyboard
echo KEYMAP=de-latin1-nodeadkeys >> /etc/vconsole.conf
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
pacman -Sy


#--Install for pacman Utilities
pacman -Sy --noconfirm arch-install-scripts archinstall amd-ucode bash-completion base base-devel btrfs-progs curl dosfstools efibootmgr exfat-utils fsarchiver grub git inetutils linux linux-firmware mtools memtest86+ mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils nano networkmanager network-manager-applet nvme-cli nfs-utils os-prober pacman-mirrorlist pacman-contrib reflector rsync sudo usbutils wget


#--GRUB
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg


#--GPU Drivers
#pacman -Sy --noconfirm --needed xf86-video-amdgpu mesa vulkan-radeon libva-mesa-driver mesa-vdpau


##--> INSTALL-DESKTOP <--##

#-- Budgie Desktop
#pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter budgie-desktop gnome gnome-control-center materia-gtk-theme i3lock

#--Cinnamon Desktop
#pacman -S --noconfirm lightdm lightdm-webkit2-greeter cinnamon system-config-printer gnome-keyring blueberry gnome-terminal gnome-screenshot lightdm-gtk-greeter lightdm-gtk-greeter-settings arc-gtk-theme archlinux-wallpaper

#--Gnome Desktop
#pacman -S --needed --noconfirm gdm gnome gnome-extra gnome-tweaks gnome-nettool gnome-usage arc-gtk-theme arc-icon-theme xorg

#--Plasma Desktop
#pacman -S --needed --noconfirm sddm plasma konsole kwrite dolphin materia-kde packagekit-qt5

#--xfce Desktop
pacman -S --needed --noconfirm sddm xfce4 xfce4-goodies lightdm-gtk-greeter lightdm-gtk-greeter-settings materia-gtk-theme archlinux-wallpaper


#-- Font
pacman -S --noconfirm terminus-font dina-font tamsyn-font ttf-bitstream-vera ttf-caladea ttf-carlito ttf-croscore ttf-dejavu ttf-droid  ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-sans ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur cantarell-fonts ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji


#-- System Enable / Disable
systemctl enable NetworkManager
systemctl enable systemd-networkd
systemctl enable sddm.service
#systemctl enable gdm
systemctl disable lightdm
#systemctl disable gdm
systemctl enable systemd-networkd


#--Clean unused files
pacman -Scc --noconfirm


/bin/echo -e "\e[1;32mREBOOTING IN 10..9..8..7..6..5..4..3..2..1..\e[0m"
sleep 10
sudo reboot
