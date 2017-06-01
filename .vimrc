" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

let g:ycm_confirm_extra_conf = 0

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Shougo/vimproc.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'terryma/vim-expand-region'
Plugin 'dahu/vim-fanfingtastic'
"
"" Snippets
"Bundle 'ervandew/supertab'
""Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"

 "All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
"
"autocmd vimenter * NERDTree
"autocmd vimenter * NERDTreeTabsOpen
autocmd InsertLeave * write
au FocusLost * :wa

"Set mapleader to something reasonable(space)
let mapleader = " "

"Quick Edit vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden "Hide buffers
set tabstop=4 "Tab = 4 spaces
se foldmethod=syntax
set autoindent
set copyindent
set autowrite
set number
set wrapscan
set shiftwidth=4
set smarttab
set foldlevelstart=20
set pastetoggle=<F2>
set relativenumber
set scrolloff=5
set modelines=0
set laststatus=2
set undofile

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

"Themes
set background=dark
"colorscheme molokai
colorscheme molokai
syntax enable

set list
set listchars=tab:\ \ ,trail:-,nbsp:-

"Umm...
set mouse=a

"Fast scroll
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

"Searching
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap / /\v
vnoremap / /\v
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <tab> %
vnoremap <tab> %

"Long lines
nnoremap j gj
nnoremap k gk
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set completeopt-=preview
set directory^=$HOME/.vim/tmp//
"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
set encoding=utf-8
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.ycm/.ycm_extra_conf.py'
"let g:ycm_goto_buffer_command = 'horizontal-split'
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:clang_complete_macros = 1
"let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'
"let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"
"if !exists("g:ycm_semantic_triggers")
"  let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
"f/t ignore case
let g:fanfingtastic_ignorecase = 1
map <F5> :make run<CR>
map <F7> :make<CR>
map <F9> :YcmCompleter FixIt<CR>
map <C-b> :YcmCompleter GoTo<CR>
map <S-F12> :A<CR>

map <leader>; <plug>NERDTreeTabsToggle<CR>

"Delete to the void
map <leader>d "_dd
map <Space>d "_dd

" Add empty lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" The holy one
imap jj <ESC>

noremap <leader>w :w<CR>
noremap <Space>w :w<CR>
noremap <leader>q :q<CR>
noremap <Space>q :q<CR>

" Default t
vmap <Leader>d "+d
vmap <Space>d "+d
nmap <Leader>y "+y
nmap <Space>y "+y
nmap <Leader>Y "+Y
nmap <Space>Y "+Y
vmap <Leader>y "+y
vmap <Space>y "+y
vmap <Leader>Y "+Yo clipboard:
vmap <Space>Y "+Yo clipboard:
nmap <Leader>p "+p
nmap <Space>p "+p
nmap <Leader>P "+P
nmap <Space>P "+P
vmap <Leader>p "+p
vmap <Space>p "+p
vmap <Leader>P "+Po clipboard:
vmap <Space>P "+Po clipboard:

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

autocmd BufNewFile,BufRead *.ts set syntax=typescript
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html.erb setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftwidth=4
