" Auto save on insert leave or lost focus
autocmd InsertLeave * write
au FocusLost * :wa
