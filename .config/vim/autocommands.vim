" Auto save on insert leave or lost focus
autocmd InsertLeave * write
au FocusLost * :wa

" Fix for typescript
autocmd BufNewFile,BufRead *.ts set syntax=typescript

"Set file specific commands
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html.erb setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftwidth=4


au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
