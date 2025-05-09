set autoindent
set autoread
set autowrite
set background=dark
" et colorcolumn=85
set completeopt-=preview
set copyindent
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set foldlevelstart=20
set foldmethod=syntax "Fold on code blocks
set formatoptions=qrn1
set gdefault
set hidden "Hide buffers
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modelines=0
set mouse=a
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=9
set shiftwidth=4
set smartcase
set smarttab
set tabstop=4 "Tab = 4 spaces
set textwidth=79
set title
set undodir=~/.vimundo
set undofile
set undolevels=1000
set viminfo^=%
set wildignore=*.swp,*.bak,*.pyc,*.class
set wrap
set wrapscan

set nobackup
set nowb
set noswapfile

"colorscheme monokai
colorscheme PaperColor
syntax enable

set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
