#! /bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "LANG=zh_CN.UTF-8" >> /etc/locale.conf

echo "lhq_home" > /etc/hostname

echo "root:761130" | chpasswd

useradd -m -G wheel lhq

echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/001_foo

echo "lhq:761130" | chpasswd

echo "GTK_IM_MODULE=fcitx" >> /etc/environment
echo "QT_IM_MODULE=fcitx" >> /etc/environment
echo "XMODIFIERS=@im=fcitx" >> /etc/environment
echo "SDL_IM_MODULE=fcitx" >> /etc/environment
echo "GLFW_IM_MODULE=ibus" >> /etc/environment


                                    
grub-install --efi-directory=/boot  
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd             
systemctl enable sddm 
systemctl enable networkmanager
