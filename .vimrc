set nocompatible
filetype plugin on
filetype indent on

filetype on
syntax on
"syntax enable
"set syntax =on

set nu
"set mouse =a
set showmatch
set tabstop =8
set shiftwidth =8
set softtabstop =8
set expandtab
set incsearch
set smartcase
set wildmenu
set wildmode =list:longest,list:full
set showcmd
set cursorline
set number 

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>120v.\+/
match ErrorMsg '\s\+$'

nnoremap <Esc> :nohl<Return>
inoremap jk <Esc>
inoremap <C-k> <Esc>A {<Return><Return>}<Esc>kcc
nnoremap + :s/^\(\s*\)\(\S\)/\1\/\/\2/<CR>:nohl<CR>
nnoremap - :s/^\(\s*\)\/\/\(\S\)/\1\2/<CR>:nohl<CR>

" Fix arrow keys
map OA <nop>
map OD <nop>
map OC <nop>
map OB <nop>

augroup vimrc							" Folding
        au BufReadPre * setlocal foldmethod=indent
        au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
function! CFoldLevel(lnum)
        let line = getline(a:lnum)
        if line =~ '^/\*'
                return '>1' " A new fold of level 1 starts here.
        else
                return '1' " This line has a foldlevel of 1.
        endif
endfunction

function! CFoldText()
        " Look through all of the folded text for the
        " function signature.
        let signature = ''
        let i = v:foldstart
        while signature == '' && i < v:foldend
                let line = getline(i)
                if line =~ '\w\+(.*)$'
                        let signature = line
                endif
                let i = i + 1
        endwhile

        return '+-- ' .  (v:foldend - v:foldstart) . ' Lines: ' . signature . ' '
endfunction


"gui=none
hi Type         guifg=lightgreen
hi Todo         guifg=orangered guibg=yellow2
hi Special      guifg=Orange
hi Visual       guifg=SkyBlue   guibg=grey60
hi IncSearch    guifg=#ffff60   guibg=#0000ff
