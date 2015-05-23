set nowrap
set number
syntax on
colorscheme base16-grayscale

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.lisp' , [['(', ')']] ],
    \ [ '*.{c,cpp,java}' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_ctermfgs = [0, 2, 4, 6]
