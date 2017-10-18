" Plugins
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  " INTERFACE BUILDERS
  call dein#add('Shougo/unite.vim') " The old one. Many plugins depend on it
  call dein#add('Shougo/denite.nvim') " The new one


  " WIDGETS
  call dein#add('Shougo/vimfiler.vim', {'on': 'VimFilerExplorer'}) " Filesystem
  call dein#add('majutsushi/tagbar', {'on': 'TagbarToggle'}) " File structure
  call dein#add('vim-airline/vim-airline') " Buffer and status line
  call dein#add('vim-airline/vim-airline-themes') " Airline themes
  call dein#add('ryanoasis/vim-devicons') " Airline icons
  call dein#add('~/.fzf') " Fast file searching
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' }) " fzf binding
  call dein#add('Yggdroot/indentLine') " Indent guidelines


  " WRITING AUTOMATIZATION
  call dein#add('itmammoth/doorboy.vim') " Auto closing brackets
  call dein#add('terryma/vim-multiple-cursors') " Sublime Text style multiple cursors
  call dein#add('scrooloose/nerdcommenter') " Toggle comments
  call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }) " Autocompletion engine
  call dein#add('Shougo/neosnippet.vim') " Snippets engine
  call dein#add('Shougo/neosnippet-snippets') " Snippets
  call dein#add('Shougo/deoplete-rct', {'on_ft': 'ruby'}) " Ruby autocomplete
  call dein#add('carlitux/deoplete-ternjs', {'on_ft': 'javascript'}) " JavaScript autocomplete


  " SYNTAX
  call dein#add('mattn/emmet-vim') " Automated HTML writing
  call dein#add('kchmck/vim-coffee-script') " Coffeescript support
  call dein#add('tpope/vim-rails') " Ruby on Rails support
  call dein#add('slim-template/vim-slim') " Slim templates support
  call dein#add('HerringtonDarkholme/yats.vim') " Typescript support


  " EXTERNAL COMMANDS
  call dein#add('tpope/vim-dispatch') " Exec external commands
  call dein#add('thoughtbot/vim-rspec') " Run RSpec
  call dein#add('tpope/vim-fugitive') " Run Git commands
  call dein#add('vim-syntastic/syntastic') " Linting


  " Random
  call dein#add('gmist/vim-palette') " A collection of themes
  call dein#add('editorconfig/editorconfig-vim') " Editor configuration
  call dein#add('mhinz/vim-signify') " VCS status in gutter
  call dein#add('ap/vim-css-color') " CSS colors background


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype off
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" End of plugins


" WINDOW
" Change the terminal's title
set title
" Do not beep
set visualbell
set noerrorbells
" Vertical diff widows
set diffopt+=vertical
" Enable mouse
set mouse=a
" Set theme
syntax enable
 if (has("termguicolors"))
  set termguicolors
 endif
colorscheme base16-gruvbox-dark-medium
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" CURSOR
" Highlight current line
set cursorline
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'


" FILE
" Set  encoddings
" The encoding displayed
set encoding=utf-8
" The encoding written to file
set fileencoding=utf-8
" Keep the changes to the buffer without writing them to the file
set hidden


" LINES
" Relative line numbers
set number relativenumber
" Turn off automatic line wrapping
set nowrap
" Prefer Unix-style line endings
set fileformats=unix,dos,mac


" CHARACTERS
" Devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 11
" Set show matching parenthesis
set showmatch
" Show invisible characters
set list
set listchars=tab:▸·,eol:¬


" SEACHING
" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" Highlight search terms
set hlsearch
" Show search matches as you type
set incsearch

" HISTORY
" Remember more commands and search history
set history=1000
" Use many levels of undo
set undolevels=1000


" SPELLCHECK
set spell
set spelllang=en_us
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add
set dictionary=/usr/share/dict/words


" INDENTATION
" Indent using two spaces
set expandtab
" Two spaces instead of a tab
set tabstop=2 shiftwidth=2 expandtab
" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" Show indent guideline
set colorcolumn=120
" Make backspace work like most other apps
set backspace=indent,eol,start


" TYPING AUTOMATIZATION
" Strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l=line(".")
  let c=col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
" Remember cursor position between vim sessions
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz


" AUTOCOMPLETION
" Set autocompletion by file type
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:deoplete#enable_at_startup=1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns={}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" SNIPPETS
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#manual_complete()
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
function! s:check_back_space() "{{{
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}


" VIMFILER
let g:vimfiler_as_default_explorer=1
let g:vimfiler_ignore_pattern='^\%(\.git\|\.DS_Store\)$'
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_tree_opened_icon='▾'
let g:vimfiler_tree_closed_icon='▸'
let g:vimfiler_file_icon='-'
let g:vimfiler_marked_file_icon='*'
nmap <F3> :VimFilerExplorer<CR>


" TAGBAR
nmap <F2> :TagbarToggle<CR>


" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1


" AIRLINE
set linespace=0
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
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


" FZF
noremap <C-b> :Buffers<CR>
noremap <leader><leader> :Commands<CR>
noremap <C-p> :Files<CR>


" RSPEC
let g:rspec_command="Dispatch rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>


" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_ruby_checkers=['rubocop']
" Close automatically
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" RANDOM KEYBINDINGS
" Enter in NORMAL mode with `j-k`
imap jk <Esc>


source $HOME/.dotfiles.local/init.vim
