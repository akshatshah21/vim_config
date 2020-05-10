
set nocompatible              " be iMproved, required
filetype plugin on                  " required

map <F5> :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && g++ -std=c++17 %:r.cpp && printf "\n================\n   Running...\n================\n" && time ./a.out <CR>
map <F6> :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && g++ -std=c++17 %:r.cpp <CR>
map <F7> :w<CR>:!printf "\033c" && printf "================\n   Running...\n================\n" && time ./a.out <CR>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Townk/vim-autoclose'
Plugin 'morhetz/gruvbox'
Plugin 'wincent/terminus'
Plugin 'preservim/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
call plug#begin('~/.vim/plugged')
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()
set laststatus=2
set ts=4 sw=4
set autoindent 
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
set nu
" colorscheme atom-dark-256
" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" Speed up scrolling in Vim
set ttyfast
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline " make sure to escape the spaces in the name properly"
set background=dark
set relativenumber
set cursorline
inoremap jj <Esc>
autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments='1'
let g:indentLine_enabled = '1'
let g:airline_theme='base16_gruvbox_dark_hard'
if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
" let g:airline_powerline_fonts = 1

let g:airline_extensions = ['branch', 'tabline', 'virtualenv']
colorscheme gruvbox
set pastetoggle=<F2>  " to paste so that auto indentation doesnt affect
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" " let g:netrw_browse_split = 3
" let g:netrw_winsize = 25
" let g:netrw_altv = 1
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>o


" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" How can I map a specific key or shortcut to open NERDTree?
map <C-f> :NERDTreeToggle<CR>

