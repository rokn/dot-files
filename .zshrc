# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/rokner/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLINE_CUSTOM_CURRENT_PATH="%1~"
POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_NO_BLANK_LINE="false"
POWERLINE_PATH="short"
ZSH_THEME="powerline"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws pip python common-aliases dirhistory httpie jsontools tmux zsh-autosuggestions cargo)
autoload zmv

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


export GLOG_logtostderr=1

export EDITOR="vim"
export BROWSER="/bin/google-chrome-stable"
export JAVA_HOME="/home/rokn/Downloads/eclipse/jdk1.8.0_101"
export GRADLE_HOME="/home/rokn/Downloads/gradle-3.2"
export IDEA_HOME="/home/rokn/Downloads/idea-IU-162.2228.15"
export PYTHONSTARTUP="/home/rokn/.pythonrc"
export QT_HOME="/home/rokn/Qt/5.7/gcc_64"
export NG_HOME="/home/rokn/Documents/"
export CONDA_HOME="/home/rokn/miniconda3"


#export PYTHONPATH="/home/rokn/anaconda3/lib/python3.6/site-packages":$PYTHONPATH

export PATH="$HOME/.local/bin/:/usr/class/cs143/cool/bin:$HOME/.rvm/bin:$JAVA_HOME/bin:$GRADLE_HOME/bin:$IDEA_HOME/bin:$QT_HOME/bin:$CONDA_HOME/bin:${PATH}"

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

#eval "$(thefuck --alias fck)"
##. /home/rokn/torch/install/bin/torch-activate
#
#
export praw_client_id='cz_M8qsF14kPZg'
export praw_client_secret='Zye6tQTjKkQBVW7LQo4hWMTdymY'

export TF_CPP_MIN_LOG_LEVEL='2'

source ~/.aliasesrc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_TMUX_AUTOSTART="true"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/rokn/.sdkman"
[[ -s "/home/rokn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rokn/.sdkman/bin/sdkman-init.sh"



