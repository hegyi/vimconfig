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

let g:ctrlp_extensions = ['tag']

set cpoptions=ces$

highlight Pmenu ctermbg=238 gui=bold

set wildignore+=*/doc/*,*/tmp/*,*.so,*.swp,*.zip,*/public/*

nmap <Leader>r *viw"hy:%s/<C-r>h//gc<left><left><left>
nmap s ys
map <Leader>t :call RunCurrentTest()<CR>
map <Leader>ct :call RunCurrentLineInTest()<CR>
vnoremap a :Align
map <F5> :BufSurfBack<CR>
map <F6> :BufSurfForward<CR>
nmap <F8> :Rename 
nmap <C-d> :CtrlPTag<CR>

nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

call pathogen#infect()
call pathogen#helptags()

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "rspec"
  else
    return "ruby"
  endif
endfunction

set foldmethod=syntax
set foldlevelstart=99
nnoremap <Space> za
vnoremap <Space> za
