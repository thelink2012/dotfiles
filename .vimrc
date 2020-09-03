set nocompatible
set encoding=utf-8
let mapleader="-"
set showcmd

" Setup indentation
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
let g:detectindent_preferred_expandtab = 1 " DetectIndent option
let g:detectindent_preferred_indent = 4    " DetectIndent option

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
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+
" Actually, just enable paste for CTRL+SHIFT+V

" Visual lines instead of hard lines 
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Load last position when reopening file
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Maintain undo history between sessions
set undodir=/tmp/vim-undo
set undofile

" Disable toolbar and scrollbar in gvim
set guioptions-=T
set guioptions-=r

" Plugins via vim-plug
call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'ciaranm/detectindent'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-scripts/a.vim'
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'for': ['c', 'cpp'], 'branch': 'release'}
call plug#end()
colorscheme badwolf

" Auto reload changed files.
" Do this when the cursor is idle or we switch to another buffer.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Detect indentation of current file using 'ciaranm/detectindent'.
autocmd BufReadPost * :DetectIndent

"" CoC setup (see https://github.com/neoclide/coc.nvim) ##
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
"autocmd FileType c,cpp CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}\%=%3p%%\ %4l,%3v
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
