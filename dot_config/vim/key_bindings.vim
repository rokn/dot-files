"Quick Edit vimrc
nmap <silent> <leader>ev :cd ~/.config/vim/<CR>:e key_bindings.vim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" The holy one
imap jj <ESC>

"Searching
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %

"Long lines
nnoremap j gj
nnoremap k gk

map <leader>; :NERDTreeTabsToggle<CR>

"Delete to the void
map <leader>d "_dd
map <Space>d "_dd

" Add empty lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

noremap <leader>w :w<CR>
noremap <leader>Q :Bdelete<CR>
" Keep only current pane
nnoremap <leader>bo <c-w>o
noremap <leader>q :q<CR>

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

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Kill the damned Ex mode.
nnoremap Q <nop>


" Vimux Bindings
function! RunWithClear(command)
  VimuxRunCommand("clear")
  VimuxRunCommand(a:command)
endfunction

nmap <leader>l :VimuxRunCommand("clear")<CR>
nmap <leader>vp :VimuxPromptCommand<CR>
nmap <leader>vl :VimuxRunCommand("ls")<CR>
nmap <leader>vq :VimuxCloseRunner<CR>
nmap <leader>vz :VimuxZoomRunner<CR>
nmap <leader>vr :VimuxRunLastCommand<CR>
vmap <leader>vs "vy :call VimuxSendText(@v)<CR>

nmap <leader>g :call RunWithClear("g++ -g --std=c++11 " . bufname("%"))<CR>
nmap <leader>r :VimuxRunCommand("./a.out")<CR>
map <leader>t :call RunWithClear("./tester a.out")<CR>

map <F5> :call RunWithClear("make run")<CR>
map <F6> :call RunWithClear("make test")<CR>
map <F7> :call RunWithClear("make")<CR>

"S + R
nmap <Leader><S-r> :%s/<C-r><C-w>/

"Buffers
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>

"UndoTree
nmap <F3> :UndotreeToggle<CR>
nmap <leader>u :UndotreeFocus<CR>
