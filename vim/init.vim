" Runtime
let g:python_host_prog = $HOME . '/.apps/miniconda/envs/python2/bin/python'
let g:python3_host_prog = $HOME . '/.apps/miniconda/bin/python'


" set default charset
set encoding=utf8

" disable .swap files
set noswapfile

" auto-reload files
set autoread

" vertical diff widows
set diffopt+=vertical

" scroll quicker
set ttyfast

" enable mouse
set mouse=a

" indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set colorcolumn=120

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" do not add empty line at the end of the file
set noeol
set binary

" set show matching brackets
set showmatch

" show invisible characters
set list
set listchars=tab:»\ ,trail:·

" relative line numbers
set number relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
" relative line numbers in normal/visual mode
autocmd InsertLeave * :call NumberToggle()
" absolute line numbers in insert mode
autocmd InsertEnter * :call NumberToggle()

" turn off automatic line wrapping
set nowrap

" spell checking
set spell
set spelllang=en_us
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add
set dictionary=/usr/share/dict/words

" strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l=line(".")
  let c=col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" remember cursor position between vim sessions
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

" center buffer around cursor when opening files
autocmd BufRead * normal zz

" making clipboard system-wide
set clipboard=unnamed
set sessionoptions=buffers

source ~/.config/nvim/bundles.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keybindings.vim
source ~/.dotfiles.local/init.vim
