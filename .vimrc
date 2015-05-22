set nowrap
set number
syntax on
colorscheme grey

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.lisp' , [['(', ')']] ],
    \ [ '*.{c,cpp,java}' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_ctermfgs = [8, 2, 3, 6]
