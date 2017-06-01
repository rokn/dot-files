#!/bin/sh

HOME="/home/$1"

FILES_FOR_HOME=".vim .fonts .local .i3 .aliasesrc .vimrc .Xresources .zshrc .config"

rsync --progress -u -r $FILES_FOR_HOME -t $HOME/
rsync --progress -u -r compton.conf $HOME/.config/
rsync --progress -u -r powerline.zsh-theme $HOME/.oh-my-zsh/custom/themes/
