
#! /bin/bash
echo " [archlinuxcn]" >> /etc/pacman.conf
echo ' Server = http://repo.archlinuxcn.org/$arch ' >> /etc/pacman.conf
echo '## china ' > /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.163.com/archlinux/'$repo/os/'$arch               ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.hit.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.hit.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch             ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch        ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch       ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.nju.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.redrock.team/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirror.redrock.team/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch    ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch  ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

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



cat > /mnt/ses.sh << EOF

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

echo "inoremap <esc> <nop>          " >> /home/lhq/.vimrc
echo "inoremap jj <esc>             " >> /home/lhq/.vimrc
echo "inoremap <up> <nop>           " >> /home/lhq/.vimrc
echo "nnoremap <up> <nop>           " >> /home/lhq/.vimrc
echo "inoremap <down> <nop>         " >> /home/lhq/.vimrc
echo "nnoremap <down> <nop>         " >> /home/lhq/.vimrc
echo "nnoremap <left> <nop>         " >> /home/lhq/.vimrc
echo "inoremap <left> <nop>         " >> /home/lhq/.vimrc
echo "inoremap <right> <nop>        " >> /home/lhq/.vimrc
echo "nnoremap <right> <nop>        " >> /home/lhq/.vimrc
echo "nnoremap k gk                 " >> /home/lhq/.vimrc
echo "nnoremap gk k                 " >> /home/lhq/.vimrc
echo "nnoremap j gj                 " >> /home/lhq/.vimrc
echo "nnoremap gj j                 " >> /home/lhq/.vimrc
echo "                              " >> /home/lhq/.vimrc
echo "set tabstop=4                 " >> /home/lhq/.vimrc
echo "set softtabstop=4             " >> /home/lhq/.vimrc
echo "set mouse=a                   " >> /home/lhq/.vimrc
echo "set shiftwidth=4              " >> /home/lhq/.vimrc
echo "set autoindent                " >> /home/lhq/.vimrc
echo "set shiftwidth=4              " >> /home/lhq/.vimrc
echo "set softtabstop=4             " >> /home/lhq/.vimrc

echo " [archlinuxcn]" >> /etc/pacman.conf
echo ' Server = http://repo.archlinuxcn.org/$arch ' >> /etc/pacman.conf

echo '## china ' > /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.163.com/archlinux/$repo/os/$arch               ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.hit.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.hit.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch             ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch        ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch       ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.nju.edu.cn/archlinux/$repo/os/$arch            ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirror.redrock.team/archlinux/$repo/os/$arch           ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirror.redrock.team/archlinux/$repo/os/$arch          ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch    ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch  ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
echo 'Server = http://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch ' >> /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

                                    
grub-install --efi-directory=/boot  
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd             
systemctl enable sddm 
systemctl enable networkmanager
EOF



pacstrap /mnt linux base linux-firmware man-db man-pages texinfo vim sudo networkmanager dhcpcd nm-connection-editor network-manager-applet fcitx5 fcitx5-chinese-addons fcitx5-chewing fcitx5-im xorg i3-wm sddm i3status i3lock ttf-dejavu wqy-zenhei grub efibootmgr feh calibre 
pacstrap /mnt archlinuxcn-keying
pacstrap /mnt yay
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt /bin/bash ses.sh
