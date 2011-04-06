" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorteterm.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torterm"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal guibg=black ctermbg=16 guifg=grey80 ctermfg=252
highlight Search ctermbg=196 cterm=bold guibg=red gui=bold ctermfg=16 guifg=black
highlight Visual gui=bold cterm=bold guifg=#404040 ctermfg=238
highlight Cursor ctermbg=46 cterm=bold guibg=green gui=bold ctermfg=16 guifg=black
highlight Special guifg=orange ctermfg=214
highlight Comment guifg=#80a0ff ctermfg=111
highlight StatusLine guibg=white ctermbg=231 guifg=blue ctermfg=21
highlight Statement gui=none cterm=none guifg=yellow ctermfg=226
highlight Type gui=none cterm=none

" Console

" only for vim 5
if has("unix")
  if v:version<600
  endif
endif

