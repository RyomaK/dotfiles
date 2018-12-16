#!bin/bash

echo "##### setup fish #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

if test -z $(which fisherman); then
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/.config/fish/functions/fisher.fish
fi

echo "----- install fish -----"
if test -z $(which fish); then
  brew install fish
fi

echo "-----power line -------"
git clone git@github.com:powerline/fonts.git
cd fonts && ./install.sh

echo "----- link fish -----"
LINK_FILES=(.config/fish)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null

	ln -sf $(PWD)/fish/$file ~/$file; \
done

echo "##### finish to setup fish #####"
