let cPath="~/.config/vim/"
let pluginsPath = cPath . "plugins.vim"
let settingsPath = cPath . "settings.vim"
let pluginConfigPath = cPath . "plugin_config.vim"
let autocmdPath = cPath . "autocommands.vim"
let keymapPath = cPath . "key_bindings.vim"
set nocompatible "No Vi for you
filetype off "Vundle required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Load plugins from config
exec "source " . pluginsPath

call vundle#end()            " required

filetype plugin indent on "Re-enable required

"The leader of all hotkeys
let mapleader = " "

exec "source " . settingsPath
exec "source " . pluginConfigPath
exec "source " . autocmdPath
exec "source " . keymapPath
