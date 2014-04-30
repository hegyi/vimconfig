set nocompatible
set t_ut=
set cursorline 
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
set t_Co=256
filetype on
filetype plugin on
filetype indent on
set hidden
set cpoptions=ces$
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
set relativenumber
set gfn=Monospace\ 12
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_by_filename = 1
" let loaded_matchparen = 1

set timeout timeoutlen=500 ttimeoutlen=500
set cpoptions=ces$

highlight Pmenu ctermbg=238 gui=bold

set wildignore+=*/doc/*,*/tmp/*,*.so,*.swp,*.zip,*/public/*,*.gif,*.png,*.jpg

map k gk
map j gj
map <Up> gk
map <Down> gj
nmap s ys
" map <Leader>t :call RunCurrentTest()<CR>
" map <Leader>ct :call RunCurrentLineInTest()<CR>
map <c-d> :CtrlPTag<CR>

map <Leader>w :Rview<CR>
map <Leader>c :Rcontroller<CR>
map <Leader>m :Rmodel<CR>
map <Leader>s :A<CR>
map <Leader>h :Rhelper<CR>

" vnoremap a :Align
map <F5> :BufSurfBack<CR>
map <F6> :BufSurfForward<CR>
nmap <F8> :Rename 

vnoremap f "fy:Ack <C-r>f<CR>

nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

let g:rspec_command = "!rspec {spec} > rspec_output 2>&1"
map <Leader>t :call RunAllSpecs()<CR>:redraw!<CR>
map <Leader>ct :call RunCurrentSpecFile()<CR>:redraw!<CR>

call pathogen#infect()
call pathogen#helptags()

let g:ackprg="ack-grep -H -a --nocolor --nogroup --column"

let g:solarized_termcolors=256

map <leader>l :Bufstop<CR>



function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>


function! ExtractVariable()
  let name = input("Variable name: ")
  if name == ''
    return
  endif
  normal! gv
  exec "normal c" . name
  exec "normal! O" . name . " = "
  normal! $p
endfunction
vnoremap <leader>e :call ExtractVariable()<cr>

