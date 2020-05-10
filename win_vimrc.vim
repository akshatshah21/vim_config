set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline' " For the status bar
Plugin 'vim-airline/vim-airline-themes' " For theme of airline
Plugin 'Townk/vim-autoclose'    " Auto close (,{,[,' and double quotes
Plugin 'wincent/terminus'
Plugin 'preservim/nerdtree'
" Plugin 'neoclide/coc.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" " Initialize plugin system
" call plug#end()

set laststatus=2
set ts=4 sw=4
set autoindent
set nu
" Display different types of white spaces.
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
" Speed up scrolling in Vim
set ttyfast
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly"
syntax enable
set relativenumber
set cursorline
inoremap jj <Esc>
autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
let g:airline_theme='base16_gruvbox_dark_hard'
if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
	endif
let g:airline_powerline_fonts = 1

map <F5> :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && g++ -std=c++14 %:r.cpp && printf "\n================\n   Running...\n================\n" && time ./a.exe <CR>
map <F6> :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && g++ -std=c++17 %:r.cpp <CR>
map <F7> :w<CR>:!printf "\033c" && printf "================\n   Running...\n================\n" && time ./a.exe <CR>
hi Normal ctermbg=none
hi Normal ctermbg=none
hi NonText ctermbg=none
set pastetoggle=<F2>  " to paste so that auto indentation doesnt affect
colorscheme gruvbox
set background=dark
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set hlsearch
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_browse_split = 3
" let g:netrw_winsize = 25
" noremap <silent> <A-Right> :tabnext<CR>
" noremap <silent> <A-Left> :tabprevious<CR>
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#taboo#enabled = 1


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
