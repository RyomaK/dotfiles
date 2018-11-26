.PHONY: nvim fish mac

init: nvim fish mac terminal git ## setup and install all

clean: ## delete auto created file and directory
	rm -rf ~/langserver

nvim-clean: ## when python3 neovim is broken, run this.
	rm -rf /usr/local/lib/python3.7/site-packages/
	brew uninstall --ignore-dependencies python3
	rm -rf ~/.config/dein/.cache
	rm -rf ~/.config/dein/cache_nvim
	brew insall python3
	pip3 install neovim

nvim: ## install and setup neovim
	bash ./nvim/bin/init.sh

fish: ## install and setup fish
	bash ./fish/bin/init.sh

mac: ## install mac app
	bash ./mac/bin/init.sh

terminal: ## setup terminal setting
	bash ./mac/bin/terminal.sh

git: ## setup gitconfig and so on...
	bash ./mac/bin/git.sh

