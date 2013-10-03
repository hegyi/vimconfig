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
let g:ctrlp_working_path_mode = 0
let loaded_matchparen = 1

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

vnoremap f "fy:Ack <C-r>f<CR>

nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

vnoremap y ygv"+y

call pathogen#infect()
call pathogen#helptags()

let g:ackprg="ack-grep -H -a --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner . " " . g:bjo_test_filei . " > test_commands"
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!e ")
      exec ':silent !echo "e ' . g:bjo_test_file . '" > test_commands'
      :redraw!
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

  exec ':silent !echo "e ' . g:bjo_test_file . ':' . g:bjo_test_file_line . '" > test_commands'
  :redraw!
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
  let g:bjo_test_file=g:bjo_test_file
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

let g:solarized_termcolors=256
