set nocompatible
set t_ut=
set cursorline
colorscheme vibrantink
set splitbelow
set splitright
set undolevels=1000
set history=1000
set title
set ruler
set nobackup
set mouse=a
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
set lazyredraw
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

highlight Pmenu ctermbg=240 gui=bold
highlight CursorLine ctermbg=238

set wildignore+=*/doc/*,*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/public/*,*.gif,*.png,*.jpg
let g:ctrlp_max_files = 0

map k gk
map j gj
" map <Up> gk
" map <Down> gj
nmap s ys
" map <Leader>t :call RunCurrentTest()<CR>
" map <Leader>ct :call RunCurrentLineInTest()<CR>
" map <c-d> :CtrlPTag<CR>
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

map <Leader>w :Rview<CR>
map <Leader>c :Rcontroller<CR>
map <Leader>m :Rmodel<CR>
map <Leader>s :A<CR>
map <Leader>h :Rhelper<CR>

" vnoremap a :Align

" nnoremap <C-Down> :m+<CR>==
" nnoremap <C-Up> :m-2<CR>==
" inoremap <C-Down> <Esc>:m+<CR>==gi
" inoremap <C-Up> <Esc>:m-2<CR>==gi
" vnoremap <C-Down> :m'>+<CR>gv=gv
" vnoremap <C-Up> :m-2<CR>gv=gv

let g:rspec_command = "!rspec {spec} > rspec_output 2>&1"
map <Leader>t :Dispatch bundle exec rspec spec<CR>
map <Leader>ct :call RunCurrentSpecFile()<CR>:redraw!<CR>


call pathogen#infect()
call pathogen#helptags()

let g:solarized_termcolors=256

map <leader>l :Bufstop<CR>


let g:multi_cursor_prev_key='<C-y>'

map <leader>cc :w !xsel -i -b<CR>

let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set expandtab

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = { 'passive_filetypes': ['python', 'html', 'ruby'] }

set t_Co=256

iabbrev ¬ require 'byebug'<cr>byebug<ESC>:w<cr>

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost * set expandtab | retab
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let test#strategy = "dispatch"

map <F6> :TestFile<CR>
map <F7> :TestNearest<CR>

" " Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

nnoremap <silent> <C-p> :FZF -m<cr>
