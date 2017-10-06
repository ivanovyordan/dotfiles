"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

  " Syntax
  " HTML
  call dein#add('othree/html5.vim')
  call dein#add('skwp/vim-html-escape')
  call dein#add('mattn/emmet-vim')
  " JavaScript
  call dein#add('othree/yajs.vim')
  call dein#add('othree/jsdoc-syntax.vim')
  call dein#add('heavenshell/vim-jsdoc')
  call dein#add('elzr/vim-json')
  call dein#add('HerringtonDarkholme/yats.vim')
  "CSS
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('ap/vim-css-color')
  "Mrkdown
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  " Ruby
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('slim-template/vim-slim')
  call dein#add('ngmy/vim-rubocop')
  call dein#add('thoughtbot/vim-rspec')
  call dein#add('tpope/vim-endwise')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('mhinz/vim-signify')
  call dein#add('junegunn/gv.vim')

  " Autocomplete
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/deoplete.nvim')

  " Interfaces
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'})
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('majutsushi/tagbar', {'on': 'TagbarToggle'})
  call dein#add('vim-airline/vim-airline')

  " Utils
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('rhysd/vim-grammarous')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('itmammoth/doorboy.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('tpope/vim-dispatch')

  " Theme
  call dein#add('gmist/vim-palette')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Neovim settings
" Theme
 syntax enable
 if (has("termguicolors"))
  set termguicolors
 endif
colorscheme tomorrow-night
" Relative line numbers
set number relativenumber

" The encoding displayed
set encoding=utf-8
" The encoding written to file
set fileencoding=utf-8
" Keep the changes to the buffer without writing them to the file
set hidden
" Turn off automatic line wrapping
set nowrap
" Set show matching parenthesis
set showmatch
" Scroll quicker
set ttyfast
" Enable mouse
set mouse=a

" Window
" Change the terminal's title
set title
" Do not beep
set visualbell
set noerrorbells

" Spellcheck
set spell
set spelllang=en_us
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add

" Indentation
" Indent using two spaces
set expandtab
" Two spaces instead of a tab
set tabstop=2 shiftwidth=2 expandtab
" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" Searching
" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" Highlight search terms
set hlsearch
" Show search matches as you type
set incsearch

" History
" Remember more commands and search history
set history=1000
" Use many levels of undo
set undolevels=1000

"Invisibles
" Show invisible characters
set list
set listchars=tab:▸·,eol:¬,trail:●
" Prefer Unix-style line endings
set fileformats=unix,dos,mac
" Strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Remember cursor position between vim sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

" KEYS
" Make backspace work like most other apps
set backspace=indent,eol,start

" Enter in NORMAL mode with `j-k`
imap jk <Esc>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" PLUGINS
" Devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

" Vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nmap <F3> :VimFilerExplorer<CR>

" Tagbar
nmap <F2> :TagbarToggle<CR>

" Rspec
let g:rspec_command = "Dispatch bin/rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Multicursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete()
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"

function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" fzf
noremap <C-b> :Buffers<CR>
noremap <C-g> :Ag<CR>
noremap <leader><leader> :Commands<CR>
noremap <C-p> :Files<CR>

" Vim repeat - Keep at bottom
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

source $HOME/.dotfiles.local/init.vim
