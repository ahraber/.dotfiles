" .vimrc - Alex H. Raber

no <up> <Nop>
ino <up> <Nop>
vno <up> <Nop>
no <down> <Nop>
ino <down> <Nop>
vno <down> <Nop>
no <left> <Nop>
ino <left> <Nop>
vno <left> <Nop>
no <right> <Nop>
ino <right> <Nop>
vno <right> <Nop>

set pastetoggle=<F2>
set clipboard=unnamed

let mapleader = ","

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

noremap <C-z> :w!<CR>
inoremap <C-z> :w!<CR>
vnoremap <C-z> :w!<CR>

noremap <C-e> :q!<CR>   " Quit current window
noremap <C-E> :qa!<CR>    " Quit all windows

noremap <C-x> :wq!<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

vnoremap <Leader>s :sort<CR>

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

filetype off
filetype plugin indent on
syntax on

set number   " show line numbers
set tw=79    " width of document (used by gd)
set nowrap   " don't automatically wrap on load
set fo-=t    " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

vmap Q gq
nmap Q gqap

set history=700
set undolevels=700

syn on

set hlsearch
set incsearch
set smartcase
set showcmd
set ruler

set nobackup
set nowritebackup
set noswapfile


" Set Pathogen to manage your plugins
" call pathogen#infect()
