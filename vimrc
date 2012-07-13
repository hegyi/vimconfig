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
map tc :!cucumber features -f progress<CR>
nmap <Leader>r *viw"hy:%s/<C-r>h//gc<left><left><left>


nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

call pathogen#infect()
call pathogen#helptags()

" -- neocomplcache
let g:acp_enableAtStartup = 0
"Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
"Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
"Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
