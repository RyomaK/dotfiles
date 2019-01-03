#!bin/bash

echo "##### install mac apps #####"

if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

echo "----- install iterm -----"
if [ -d /Applications/iTerm.app/ ]; then
  echo "iterm already exists"
else
  brew cask install iterm2
fi

echo "----- install other tools -----"
if [ ! -d /Applications/Dropbox.app ]; then
  brew cask install dropbox
fi
if [ ! -d "/Applications/Google Chrome.app" ]; then
  brew cask install google-chrome
fi
if [ ! -d "/Applications/ShiftIt.app" ]; then
  brew cask install shiftit
fi
if [ ! -d "/Applications/HyperSwitch.app" ]; then
  brew cask install hyperswitch
fi
if [ ! -d "/Applications/Slack.app" ]; then
  brew cask install slack
fi

if [ ! -d "/Applications/Docker.app" ]; then
  brew cask install docker
fi

echo "##### finish to install mac apps #####"

if test -z $(which go);then
  brew install goenv
fi

if test -z $(which go);then
  brew install go
fi
fi
