# Path to your oh-my-zsh configuration.
source $HOME/src/github.com/zsh-users/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle mvn
antigen bundle golang
antigen theme candy

antigen apply

# for brew
export PATH=$PATH:/usr/local/bin


# for history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # if exist then save command
    [[ ${#line} -ge 5
        && ${cmd} != (l|l[sal])
        && ${cmd} != (c|cd)
        && ${cmd} != (m|man)
    ]]
}

## for peco
function peco_select_history() {
  local tac_cmd
  which gtac &> /dev/null && tac_cmd=gtac || tac_cmd=tac
  BUFFER=$($tac_cmd ~/.zsh_history | sed 's/^: [0-9]*:[0-9]*;//' \
    | peco --query "$LBUFFER")
  CURSOR=$#BUFFER         # move cursor
  zle -R -c               # refresh
}
zle -N peco_select_history
bindkey '^R' peco_select_history

function peco_src() {
  local src_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src_dir" ]; then
      BUFFER="cd $src_dir"
      zle accept-line
  fi
  # zle clean-screen
  zle -R -c               # refresh
}
zle -N peco_src
bindkey '^S' peco_src

# add visual studio code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# for custom
source $HOME/.zshrc.mine



