"pathgen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"File encoding
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030

"
if has("gui_running")
    set guifont=Monaco:h13
    set guifontwide=WenQuanYi\ Micro\ Hei:h13
    colorscheme molokai
else
    colorscheme torterm
endif

"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"设置自动缩进
set cindent

"显示行号
set nu

"自动语法高亮
syntax on

"解决backspace问题"
set backspace=indent,eol,start

"搜索问题
set hlsearch
set ignorecase
set incsearch
"use perl/python mode of regex search
" ,/ turn off search highlighting

"set leader to ,
let mapleader=","
let g:mapleader=","
nmap <leader>/ :nohl<CR>
nmap <leader>n :set nu!<CR>

"command mode by typing ; instead of ; under normal mode
nnoremap ; :

"Markdown language syntax settings
augroup mkd
autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

"auto new line
"set textwidth=80

"set current working directory globally
autocmd BufEnter * lcd %:p:h

"line space
set linespace=2

"open nerd tree by F5
map <F5> :NERDTreeToggle<CR>
imap <F5> <ESC>:NERDTreeToggle<CR>
imap <k0> 0

"auto remove ending spaces
function! RemoveEndingWhiteSpace()
    :if search("[ \t]$")
    :    %s/[ \t]\+$//
    :endif
endfunction
au! BufWritePre * ks|call RemoveEndingWhiteSpace()|'s

"auto load .vimrc after refresh
autocmd BufWritePost ~/.vimrc   so ~/.vimrc

"reload the current file's snippets
"how to invoke?
function! ReloadSnippets()
    call ResetSnippets()
    call GetSnippets("~/.vim/bundle/snipmate/snippets/", &filetype)
endfunction
"reload snippets for current filetype
map <F6> :call ReloadSnippets()<CR>
imap <F6> <ESC>:call ReloadSnippets()<CR>

"F7: Edit snippet
function! EditSnippets()
    let filename= "~/.vim/bundle/snipmate/snippets/". &filetype . '.snippets'
    exe 'vs' . filename
endfunction
map <F7> :call EditSnippets()<CR>
imap <F7> <ESC>:call EditSnippets()<CR>



"reload .vimrc
map <F4> :so ~/.vimrc<CR>
imap <F4> <ESC>:so ~/.vimrc<CR>

" Set to auto read when a file is changed from the outside
set autoread

set ruler "Always show current position

set cmdheight=2 "The commandbar height

"ctags, looking for current direcotry for tags
set tags=tags;/

let g:ifold_mode=2

"from vgod
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" high light current line and column
"set cursorcolumn " highlight the current column
set cursorline " highlight current line
set showcmd
set showmatch

"saving when losing focus
au FocusLost * :wa

"
set ttyfast
"set relativenumber

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

