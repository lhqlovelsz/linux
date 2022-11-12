#! /bin/bash

cp pacman.conf /etc/
cp mirrorlist /etc/pacman.d/
cp config /home/lhq/.config/i3/
pacman -Sy
pacman -S man-db man-pages texinfo vim sudo networkmanager dhcpcd nm-connection-editor network-manager-applet fcitx5 fcitx5-chinese-addons fcitx5-chewing fcitx5-im xorg i3-wm sddm i3status i3lock ttf-dejavu wqy-zenhei grub efibootmgr feh calibre xfce4-terminal
pacman -S archlinuxcn-keyring
pacman -S  yay
