set nocompatible
colorscheme vibrantink
set undolevels=1000
set history=1000 
set title
set ruler
set nobackup
set noswapfile
set visualbell
set noerrorbells
set autoindent
set laststatus=2
set scrolloff=4
set copyindent
set shiftwidth=2
set tabstop=2
set ignorecase
set showmatch
set smartcase
set hlsearch
set incsearch
set wrapscan
filetype on
filetype plugin on
filetype indent on
set hidden
set cpoptions=ces$
set number
syntax on
set showmode
set expandtab
set bs=2
set showcmd
set virtualedit=all
set wildmenu
set fillchars=""
set modifiable
set write
set gfn=Monospace\ 12
set cursorline


highlight Pmenu ctermbg=238 gui=bold

map tt :!rspec spec<CR>
map tc :!cucumber features<CR>
nmap <Leader>r *viw"hy:%s/<C-r>h//gc<left><left><left>
nmap <Leader>c viw"hy:Ack "class <C-r>h( )?"<CR>:bd<CR>


nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

call pathogen#infect()
call pathogen#helptags()

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
