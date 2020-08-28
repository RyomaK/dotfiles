#!/bin/bash

if [ -z $(which nvim) ]; then
    brew install neovim
fi

if [ -z $(which pip3) ]; then
    brew install python3
    pip3 install neovim
else
    pip3 install neovim --upgrade
fi

if [ -d ~/.config/dein/repos ]; then
    echo "dein.vim is already installed"
else
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein  &>/dev/null
    echo "finish to insall dein"
fi
