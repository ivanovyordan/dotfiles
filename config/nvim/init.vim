" Use a POSIX shell inside vim
set shell=bash
" Change leader
let mapleader=' '
" Set Python path
let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim/bin/python'

call plug#begin('~/.vim/plugged')
  " File manager
   Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim'
  " Fuzzy file search
  Plug $HOME . '/.fzf' | Plug 'junegunn/fzf.vim'
  " Better tmux integration
  Plug 'christoomey/vim-tmux-navigator' | Plug 'benmills/vimux'
  " Easier file system operations
  Plug 'tpope/vim-eunuch'
  " Share basic file config in a project
  Plug 'editorconfig/editorconfig-vim'
  " Color scheme
  Plug 'ayu-theme/ayu-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'jacoborus/tender.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  " Snippets
  Plug 'honza/vim-snippets' | Plug 'mattn/emmet-vim'
  " Easy movement
  Plug 'easymotion/vim-easymotion'
  " Language server and liter
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Languages
  Plug 'hashivim/vim-terraform'
  Plug 'fatih/vim-go', {'for': 'go'}
  Plug 'dag/vim-fish', {'for': 'fish'}
  Plug 'vim-python/python-syntax', {'for': 'python'} | Plug 'lepture/vim-jinja'
  Plug 'pangloss/vim-javascript', {'for': 'javascript'} | Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
  " Personal wiki and diary
  Plug 'vimwiki/vimwiki'
  Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'pandoc'}
  Plug 'iamcco/markdown-preview.nvim', {'for': 'pandoc', 'do': 'cd app & yarn install'}
  Plug 'dbmrq/vim-ditto', {'for': 'pandoc'}
  Plug 'ron89/thesaurus_query.vim', {'for': ['pandoc', 'mail', 'gitcommit']}
  Plug 'junegunn/vim-easy-align', {'for': 'pandoc'}
  " Testing
  Plug 'janko/vim-test'

  " Use vim in browser
  Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(0)}}

  Plug $HOME . '/workspace/stuff/dbt.vim', {'do': ':UpdateRemotePlugins'}
call plug#end()

" Engine
" Enable integrated plugins
syntax on
filetype plugin indent on
" System-wide clipboard
set clipboard+=unnamedplus
" Windows
" Enable commands menu
set wildmenu
set wildmode=longest:full,full
" Vertical diff windows
set diffopt+=vertical
" Set default split
set splitright
set splitbelow

" Buffers
" Allow unsaved work on buffers
set hidden
" Better searching
set incsearch
set hlsearch
set ignorecase
set smartcase
" Indent using two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" Turn off line wrapping
set nowrap

" On save
" Strip trailing white space
autocmd BufWritePre * %s/\s\+$//e
" Disable swap file
set noswapfile
" Maintain undo history between sessions
set undofile
" Enable watchers
set backupcopy=yes
" Spell check
set spell spelllang=en_us

" Visuals
" Show current line number
set number
" Relative line number
set relativenumber
" Enable 24-bit colors
set termguicolors
" Show wrap line
set colorcolumn=120
" Always draw sign column
set signcolumn=yes
" Font
set guifont=JetBrains\ Mono
" Set color scheme
try
  set background=dark
  " let ayucolor='light'
  let ayucolor='dark'
  let base16colorspace=256

  colorscheme ayu
  " colorscheme tender
  " colorscheme base16-tomorrow-night
catch
  colorscheme slate
endtry

if exists('g:started_by_firenvim')
  set guicursor+=a:blinkon0
  set guicursor-=a:blinkon0
  set guicursor&
  echo "NVIM"
endif


" Keyboard shortcuts
" Enter in NORMAL mode with `j-k`
imap jk <Esc>

" Easy window navigation
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Auto close pairs
inoremap ( ()<left>
inoremap <expr> ) getline('.')[getpos('.')[2] - 1] == ')' ? '<right>' : ')'
inoremap [ []<left>
inoremap <expr> ] getline('.')[getpos('.')[2] - 1] == ']' ? '<right>' : ']'
inoremap <expr> { getline('.')[getpos('.')[2] - 2] == '{' ? '{  }<left><left>' : '{}<left>'
inoremap <expr> } getline('.')[getpos('.')[2] - 1] == '}' ? '<right>' : '}'
inoremap < <><left>
inoremap <expr> > getline('.')[getpos('.')[2] - 1] == '>' ? '<right>' : '>'
inoremap <expr> " getline('.')[getpos('.')[2] - 1] == '"' ? '<right>' : '""<left>'
inoremap <expr> ' getline('.')[getpos('.')[2] - 1] == "'" ? '<right>' : getline('.')[getpos('.')[2] - 1] == "n" ? "'" : "''<left>"
inoremap <expr> ` getline('.')[getpos('.')[2] - 1] == '`' ? '<right>' : '``<left>'
inoremap <expr> # getline('.')[getpos('.')[2] - 2] == '{' ? '#  #<left><left>' : '#'
inoremap <expr> % getline('.')[getpos('.')[2] - 2] == '{' ? '%  %<left><left>' : getline('.')[getpos('.')[2] - 2] == '<' ? '%=  %<left><left>' : '%'

" Plugins
" fzf config
noremap <c-b> :Buffers<cr>
noremap <c-p> :Files<cr>
noremap <c-g> :GitFiles<cr>

" coc
let g:coc_global_entensions=[
  \ 'coc-word',
  \ 'coc-git',
  \ 'coc-html', 'coc-emmet',
  \ 'coc-vimlsp',
  \ 'coc-python',
  \ 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-diagnostic',
  \ 'coc-marketplace',
\]

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" use `:Imports` for organize import of current buffer
command! -nargs=0 Imports :call CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>rf <Plug>(coc-refactor)
nmap <leader>o :<c-u>CocList outline<cr>
nmap <leader>s :<C-u>CocList -I symbols<cr>
imap <c-j> <Plug>(coc-snippets-expand-jump)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Vimwiki
au FileType vimwiki set filetype=vimwiki.markdown
let g:vimwiki_global_ext=0
let g:vimwiki_list=[{
  \ 'path': '~/Dropbox/wiki/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
\ }]


" Vimux
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vl :VimuxRunLastCommand<cr>
map <leader>vi :VimuxInspectRunner<cr>
map <leader>vz :VimuxZoomRunner<cr>
map <leader>vc :VimuxCloseRunner<cr>

" Vim.test
let test#strategy='vimux'
nmap <leader>tn :TestNearest<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tl :TestLast<cr>

" Align tables
autocmd fileType markdown,yaml vmap <leader><bslash> :EasyAlign*<bar><enter>

" Call Ranger
map <leader>f :Ranger<cr>

" DBT
let g:dbt_autostart=0
let g:dbt_host="127.0.0.1"
let g:dbt_path=['run', 'staging', 'dbt']
let g:dbt_compile_on_open = 0
let g:dbt_compile_on_save = 0

map <leader>dc :DbtCompileSql<cr>
