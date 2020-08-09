#!bin/bash

## install brew
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

echo "----- install chrome ----"
if [ ! -d "/Applications/Google Chrome.app" ]; then
  brew cask install google-chrome
fi

echo "----- install slack ----"
if [ ! -d "/Applications/Slack.app" ]; then
  brew cask install slack
fi

echo "----- install docker ----"
if [ ! -d "/Applications/Docker.app" ]; then
  brew cask install docker
fi

## language

if test -z $(which go);then
  brew install goenv
fi
