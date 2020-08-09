all: install

install: deps brew setting link

deps:
	which brew || /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
	brew install wget hub tig tree tmux reattach-to-user-namespace ghq peco node goenv
	brew cleanup

brew-cask:
	brew cask install chrome
	which docker || brew install docker
	which code || brew cask install visual-studio-code

${HOME}/src/github.com/zsh-users/antigen:
	git clone git@github.com:zsh-users/antigen.git $@

settings:=vimrc
setting:
	$(foreach setting,$(settings),sh setting_$(setting).sh)

PWD:=$(shell pwd)
srcs:=vimrc vim gitconfig zshrc tmux.conf zshrc.mine
link: ${HOME}/src/github.com/zsh-users/antigen
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/.$(src);)

.PHONY: install deps brew brew-cask link

