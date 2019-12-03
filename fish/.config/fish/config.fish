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
set -x PATH $PATH ~/develop/flutter/bin
#rbenv
set -x PATH $PATH $HOME/.rbenv/bin
rbenv init - | source
#goenv
set -x PATH $PATH $HOME/.goenv/bin
goenv init - | source
#pyenv
set -x PATH $PATH $HOME/.pyenv/bin
pyenv init - | source
eval (python -m virtualfish)
set -x WORKON_HOME $HOME/.virtualenvs
#alias
alias vim 'nvim'
alias goland '/usr/local/bin/goland'

## vi mode
fish_vi_key_bindings

set -x GO111MODULE on
# fnm
fnm env --multi | source

# flutter
