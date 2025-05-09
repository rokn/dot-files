export ZSH=$HOME/.oh-my-zsh

plugins=(git pip python httpie task)
autoload zmv

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

export PATH="$HOME/.local/bin/:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#fancy ctrl z for vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source ~/.conifg/aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
