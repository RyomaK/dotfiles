# go
export GOPATH=$HOME/develop/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
#自作コマンド
#export PATH=$HOME/develop/cmd:$PATH
Alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"
if which rbenv > /dev/null; then eval "$(rbenv init -)";
