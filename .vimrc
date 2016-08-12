filetype plugin indent off
syntax on
set backspace=indent,eol,start
au BufNewFile,BufRead *.tag set filetype=html
highlight Tab ctermbg=red guibg=red
match Tab /\t/
