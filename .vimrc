set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


autocmd vimenter * NERDTree
autocmd vimenter * NERDTreeTabsOpen
autocmd InsertLeave * write
filetype plugin on

let mapleader = ","

syntax enable
set foldmethod=syntax

set autoindent
set smartcase
set autowrite
set tabstop=4
set number
set wrapscan
set shiftwidth=4
set foldlevelstart=20
set pastetoggle=<F2>
set relativenumber

set background=dark
colorscheme molokai

set completeopt-=preview
set directory^=$HOME/.vim/tmp//

let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
set encoding=utf-8
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm/.ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:clang_complete_macros = 1
let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }

map <F5> :!make run<CR>
map <F7> :!make<CR>
map <F9> :YcmCompleter FixIt<CR>
map <C-b> :YcmCompleter GoTo<CR>
map <S-F12> :A<CR>
map <leader>; <plug>NERDTreeTabsToggle<CR>
map <leader>d "_dd
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
imap jj <ESC>
noremap <Leader>s :update<CR>

autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html.erb setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
