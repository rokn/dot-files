# Path to your oh-my-zsh installation.
export ZSH=/home/rokn/.oh-my-zsh

POWERLINE_CUSTOM_CURRENT_PATH="%1~"
POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_NO_BLANK_LINE="false"
POWERLINE_PATH="short"
ZSH_THEME="powerline"

#WSL Fix:
LS_COLORS+=':ow=01;33'

plugins=(git aws pip python common-aliases dirhistory httpie jsontools)
autoload zmv

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
export CONDA_HOME="/home/rokn/miniconda3"


#export PYTHONPATH="/home/rokn/anaconda3/lib/python3.6/site-packages":$PYTHONPATH

export PATH="$HOME/.local/bin/:$JAVA_HOME/bin:${PATH}"
export PATH="/snap/bin:${PATH}"
export PATH="/mnt/c/Users/antonio.mindov/AppData/Local/Microsoft/WinGet/Packages/AgileBits.1Password.CLI_Microsoft.Winget.Source_8wekyb3d8bbwe:${PATH}"

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
bindkey '^ ' autosuggest-accept

source ~/.aliasesrc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/rokn/.sdkman"
[[ -s "/home/rokn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rokn/.sdkman/bin/sdkman-init.sh"




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rokn/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rokn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rokn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rokn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


eval "$(jump shell)"

