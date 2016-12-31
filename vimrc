" General
set nocompatible

" Events
filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
set ofu=syntaxcomplete#Complete

" Themes/Colors
syntax enable
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

" UI
set number
set numberwidth=6 
set cul 
set laststatus=2
set nohlsearch 
set incsearch 
set ignorecase 
set ruler 
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell

" Formatting + Layout 
set autoindent 
set tabstop=2 
set softtabstop=2 
set shiftwidth=2 
set shiftround 
set expandtab 
set smartindent 
set smarttab 
set nowrap 

" Others
command PrettyJSON %!python -m json.tool
