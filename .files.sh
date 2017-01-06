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
    sudo pacman -S zsh
    install_zsh
fi
}

install_i3 () {
    sudo pacman -S i3-wm i3 i3lock i3status
    startx
}

install_aurora () {
if [[ ! -d /usr/lib/auraora/ ]]; then
    pushd /usr/lib
    git clone http://github.com/ahraber/aurora.git
    tar -xvf /usr/lib/aurora/aurora*
    sudo unlink /usr/bin/firefox
    sudo ln -s /usr/lib/aurora/firefox /usr/bin/firefox
    rm -rf *.git *.bz2
    popd
else
    echo "Aurora exsists"
    firefox &
fi
}

. ~/.bashrc
install_zsh
install_aurora
install_i3
