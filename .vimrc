set nowrap
set number
syntax on
colorscheme base16-grayscale
let g:rainbow_ctermfgs = [0, 2, 7]

au FileType c,cpp,objc,objcpp,tex,java,lisp call rainbow#load()
