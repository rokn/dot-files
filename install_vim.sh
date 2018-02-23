#!/bin/sh

HOME="/home/$1"

FILES_FOR_HOME=".vim .vimrc"

rsync --progress -u -r $FILES_FOR_HOME -t $HOME/
rsync --progress -u -r vim/ -t $HOME/.config/
