#環境変数
set -x GOPATH $HOME/develop/golang
set -x GOROOT /usr/local/go
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x XDG_CONFIG_HOME $HOME/.config
set -x QT_HOMEBREW true
set -x NVM_DIR $HOME/.nvm
set -x PKG_CONFIG_PATH `brew --prefix qt5`/lib/pkgconfig
#rbenv
set -x PATH $PATH $HOME/.rbenv/bin
rbenv init - | source
#alias
alias vim 'nvim'
alias goland '/usr/local/bin/goland'

## vi mode
fish_vi_key_bindings

