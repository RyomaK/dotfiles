all: install

install: deps brew setting link

deps:
	which brew || /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
	brew install wget hub tig tree tmux reattach-to-user-namespace ghq peco goenv nodenv coreutils nvim python
	brew cleanup

nvim:
	npm install -g neovim
	pip3 install pynvim	
nvim-clean:
	rm -rf /usr/local/lib/python3.7/site-packages/
	brew uninstall --ignore-dependencies python3
	rm -rf ~/.cache/dein/
	rm -rf ~/.cache/dein/cache_nvim
	brew install python3
	pip3 install neovim

brew-cask:
	brew cask install chrome
	which docker || brew install docker
	which code || brew cask install visual-studio-code

${HOME}/src/github.com/zsh-users/antigen:
	git clone git@github.com:zsh-users/antigen.git $@

settings:=vimrc nvim
setting:
	$(foreach setting,$(settings),sh ./shell/setting_$(setting).sh)

PWD:=$(shell pwd)
srcs:=vimrc vim gitconfig zshrc tigrc tmux.conf zshrc.mine zshrc.function.private zshrc.function config
link: ${HOME}/src/github.com/zsh-users/antigen
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/.$(src);)

.PHONY: install deps brew brew-cask link
