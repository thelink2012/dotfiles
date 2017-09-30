set nocompatible

" Setup indentation
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Eye candy settings
filetype plugin on
syntax on
set relativenumber

" HTML-specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Use ENTER to disable highlighting
nnoremap <silent> <enter> :noh<cr><esc>

" Pressing jk instead of ESC if that is too far away
" inoremap jk <Esc>

" Disable arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Enable CTRL-C, CTRL-V, CTRL-X for controlling X Clipboard
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Visual lines instead of hard lines 
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Load last position when reopening file
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Disable toolbar and scrollbar in gvim
set guioptions-=T
set guioptions-=r

" Plugins via vim-plug
call plug#begin('~/.vim/plugged')
Plug 'dikiaap/minimalist'
Plug 'sjl/badwolf'
call plug#end()
colorscheme badwolf


