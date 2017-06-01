#!/bin/sh

HOME="/home/$1"

FILES_FOR_HOME="$HOME/.vim $HOME/.fonts $HOME/.i3 $HOME/.aliasesrc $HOME/.vimrc $HOME/.Xresources $HOME/.zshrc"

rsync -r -u --progress $FILES_FOR_HOME -t ./
rsync -r -u --progress $HOME/.local/bin -t ./.local
rsync -r -u --progress $HOME/.config/compton.conf -t ./
rsync -r -u --progress $HOME/.oh-my-zsh/custom/themes/powerline.zsh-theme -t ./
