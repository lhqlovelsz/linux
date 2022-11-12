#! /bin/bash
fdisk /dev/sda << eof
g
n


+200m
n



t
1
1
w
eof

mkfs.vfat /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
pacstrap /mnt linux base linux-firmware 
genfstab -U /mnt > /mnt/etc/fstab
mkdir /mnt/myfile
cp * /mnt/myfile/
arch-chroot /mnt 
