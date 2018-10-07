#!/bin/sh

HOME="/home/$1"

FILES_FOR_HOME=".vim .fonts .local .i3 .aliasesrc .vimrc .Xresources .zshrc .config .pythonrc"

mkdir -p $HOME/.config
mkdir -p $HOME/.local
mkdir -p $HOME/.local
rsync --progress -u -r $FILES_FOR_HOME -t $HOME/
rsync --progress -u -r compton.conf -t $HOME/.config/
rsync --progress -u -r vim/ -t $HOME/.config/
rsync --progress -u -r polybar/ -t $HOME/.config/
rsync --progress -u -r powerline.zsh-theme -t $HOME/.oh-my-zsh/custom/themes/
