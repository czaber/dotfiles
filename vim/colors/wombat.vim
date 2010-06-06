" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"

" Vim >= 7.0 specific colors
if version >= 700
  hi MatchParen ctermfg=1 ctermbg=15 cterm=bold
  hi PmenuSel 	ctermfg=7 ctermbg=2 cterm=bold
  hi Pmenu 	    ctermfg=7 ctermbg=4 cterm=bold
endif

" General colors
hi Cursor 		ctermfg=none ctermbg=0
hi Normal 		ctermfg=0  ctermbg=15
hi NonText 		ctermfg=0  ctermbg=15
hi LineNr 		ctermfg=7  ctermbg=15
hi StatusLine 	ctermfg=0  ctermbg=15
hi StatusLineNC ctermfg=0  ctermbg=15
hi VertSplit 	ctermfg=0  ctermbg=15
hi Folded 		ctermfg=7  ctermbg=15
hi Title		ctermfg=0  ctermbg=15
hi Visual		ctermfg=7  ctermbg=2 cterm=bold
hi SpecialKey	ctermfg=7  ctermbg=2 cterm=bold
hi ModeMsg      ctermfg=7  ctermbg=1 cterm=bold
hi Error        ctermfg=7  ctermbg=1 cterm=bold
hi ErrorMsg     ctermfg=7  ctermbg=1 cterm=bold
hi WarningMsg   ctermfg=7  ctermbg=4 cterm=bold
hi ModeMsg      ctermfg=7  ctermbg=2 cterm=bold
hi Search       ctermfg=none ctermbg=3

" Syntax highlighting TODO
hi Comment 		ctermfg=7
hi Todo 		ctermfg=7 ctermbg=1 cterm=bold
hi Constant 	ctermfg=1
hi String 		ctermfg=1
hi Identifier 	ctermfg=4
hi Function 	ctermfg=4
"hi Type 		ctermfg=4 cterm=bold
hi Type 		ctermfg=4
hi Statement 	ctermfg=4
"hi Keyword		ctermfg=4 cterm=bold
hi Keyword		ctermfg=4
hi PreProc 		ctermfg=2
hi Number		ctermfg=1
hi Special		ctermfg=1

" TeX
hi initexNumber ctermfg=1
hi initexCommand ctermfg=4
hi initexCharacter ctermfg=1
hi initexDebug ctermfg=1
hi initexPageParameterInteger ctermfg=1
hi initexFontParameterInteger ctermfg=1
