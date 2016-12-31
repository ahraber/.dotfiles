#!/bin/bash

dir=~/.dotfiles
odir=$dir/old
files="bashrc vim vimrc vimrc.after zshrc oh-my-zsh"

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

install_vim () {
if [ -f /bin/rake -o -f /usr/bin/rake ]; then
    if [[ -f /etc/arch-release ]]; then
        sudo pacman -S rake
        /bin/bash $dir/vim/bootstrap.sh
    fi
    if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        /bin/bash $dir/vim/bootstrap.sh

    fi
    if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
        /bin/bash $dir/vim/bootstrap.sh
    fi
fi
}

install_zsh
install_vim
