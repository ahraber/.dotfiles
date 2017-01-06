#!/bin/bash

dir=~/.dotfiles
odir=$dir/old
files="bashrc zshrc oh-my-zsh xinitrc gitconfig i3"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $odir

for f in $files; do
    mv ~/.$f $odir
    ln -s $dir/$f ~/.$f
done

install_zsh () {
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    if [[ -f /etc/arch-release ]]; then
        sudo pacman -S zsh
        install_zsh
    fi
    if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        install_zsh
    fi
    if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
        install_zsh
    fi
fi
}

install_i3 () {
    sudo pacman -S i3-wm i3 i3lock i3status
    startx
}

install_firefox_dev () {
if [[ ! -d /usr/lib/auraora/ ]]; then 
    pushd $dir/firefox && tar -xvf firefox*
    sudo unlink /usr/bin/firefox
    sudo mv firefox /usr/lib/aurora
    sudo ln -s /usr/lib/aurora/firefox /usr/bin/firefox
    popd
}

. ~/.bashrc
install_zsh
install_firefox_dev
install_i3
