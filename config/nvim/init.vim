set nocompatible
syntax on

set number
set showcmd
set wildmenu
set ruler
set laststatus=2
set showtabline=2

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set showmatch

set hlsearch
set incsearch

" ----------------
" vim-plug plugins
" ----------------
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
"Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
call plug#end()
" ----------------

let mapleader=","

" gruvbox settings
colorscheme gruvbox
set background=dark

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'onedark'
set noshowmode

" vim-gitgutter settings
set signcolumn=yes
highlight clear SignColumn

" vim-signify settings
let g:signify_sign_change = '~'

