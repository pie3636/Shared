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

" display indentation guides
set list listchars=tab:❘·,trail:·,extends:»,precedes:«,nbsp:×
"set list listchars=tab:\|-,trail:-,extends:$,nbsp:=

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 8
"
" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 8

" remove trailing whitespace when writing file
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/ / /ge
autocmd BufWritePre * :silent call Indent()

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 8

"vim: sw=4

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
        " Save the last search.
        let search = @/

        " Save the current cursor position.
        let cursor_position = getpos('.')

        " Save the current window position.
        normal! H
        let window_position = getpos('.')
        call setpos('.', cursor_position)

        " Execute the command.
        execute a:command

        " Restore the last search.
        let @/ = search

        " Restore the previous window position.
        call setpos('.', window_position)
        normal! zt

        " Restore the previous cursor position.
        call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
        call Preserve('normal gg=G')
endfunction

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


autocmd FileType make setlocal noexpandtab

"gui=none
hi Type         guifg=lightgreen
hi Todo         guifg=orangered guibg=yellow2
hi Special      guifg=Orange
hi Visual       guifg=SkyBlue   guibg=grey60
hi IncSearch    guifg=#ffff60   guibg=#0000ff
hi Search       guifg=khaki     guibg=slategrey
hi Ignore       guifg=grey40

hi VertSplit    guibg=#c2bfa5   guifg=grey50
hi Folded       guibg=grey30    guifg=gold
hi FoldColumn   guibg=grey30    guifg=tan
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue guibg=#000000
hi Question     guifg=springgreen
hi SpecialKey   guifg=yellowgreen
hi StatusLineNC guibg=#c2bfa5   guifg=grey50
hi Title        guifg=indianred
hi WarningMsg   guifg=salmon


" these are from desert ... i didn't change it
" color terminal definitions
" tabs (originally darkgreen)
hi SpecialKey    ctermfg=darkblue
hi NonText   cterm=bold ctermfg=darkblue
hi Directory     ctermfg=darkcyan
hi ErrorMsg  cterm=bold ctermfg=7 ctermbg=1
hi IncSearch     cterm=NONE ctermfg=yellow ctermbg=green
hi Search    cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg   ctermfg=darkgreen
hi ModeMsg   cterm=NONE ctermfg=brown
hi LineNr    ctermfg=3
hi Question  ctermfg=green
hi StatusLine    cterm=bold,reverse
hi StatusLineNC  cterm=reverse
hi VertSplit     cterm=reverse
hi Title     ctermfg=5
hi Visual    cterm=reverse
hi VisualNOS     cterm=bold,underline
hi WarningMsg    ctermfg=1
hi WildMenu  ctermfg=0 ctermbg=3
hi Folded    ctermfg=darkgrey ctermbg=NONE
hi FoldColumn    ctermfg=darkgrey ctermbg=NONE
hi DiffAdd   ctermbg=4
hi DiffChange    ctermbg=5
hi DiffDelete    cterm=bold ctermfg=4 ctermbg=6
hi DiffText  cterm=bold ctermbg=1
hi Comment   ctermfg=darkcyan
hi Constant  ctermfg=brown
hi Special   ctermfg=5
hi Identifier    ctermfg=6
hi Statement     ctermfg=3
hi PreProc   ctermfg=5
hi Type      ctermfg=2
hi Underlined    cterm=underline ctermfg=5
hi Ignore    cterm=bold ctermfg=7
hi Error     cterm=bold ctermfg=7 ctermbg=1
