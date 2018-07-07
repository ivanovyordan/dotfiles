let g:python_host_prog = $HOME . '/.apps/miniconda/envs/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.apps/miniconda/envs/neovim3/bin/python'

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'SirVer/ultisnips'
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'benmills/vimux'
  Plug 'bkad/CamelCaseMotion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'gmist/vim-palette'
  Plug 'honza/vim-snippets'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-signify'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-surround'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vimwiki/vimwiki'
  Plug '~/.fzf'
call plug#end()

" Behavior
" System-wide clipboard
set clipboard=unnamed
" Disable swap file
set noswapfile
" Maintain undo history between sessions
set undofile
" Better searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Windows
" Vertical diff windows
set diffopt+=vertical

" Buffers
" Allow unsaved work on buffers
set hidden
" Center buffer round cursor when opening a file
autocmd BufRead * normal zz
" Remember cursor position between sessions
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
" Strip trailing white space
autocmd BufWritePre * %s/\s\+$//e

" Formatting
" Indent using two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
syntax on
filetype plugin indent on
" Turn off line wrapping
set nowrap

" Visuals
" Relative line numbers
set number relativenumber
" Show wrap line
set colorcolumn=120
" Always draw sign column
set signcolumn=yes
colorscheme tomorrow-night

" Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>y  "+y

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Enter in NORMAL mode with `j-k`
imap jk <Esc>

" Clear search highlighting
noremap <CR> :nohl<cr>

" Smaller fzf windows
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:40%'), <bang>0)
command! -bang -nargs=* Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:40%'), <bang>0)

" Deoplete
let g:deoplete#enable_at_startup=1
autocmd CompleteDone * silent! pclose!

" LSP
let g:LanguageClient_serverCommands = {
  \ 'dockerfile': ['docker-langserver', '--stdio'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'python': ['pyls'],
\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" fzf
noremap <C-b> :Buffers<CR>
noremap <C-p> :Files<CR>

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1

" vim-ruby
let g:rubycomplete_rails=1
let g:rubycomplete_load_gemfile = 1

" Vimwiki
let g:vimwiki_list = [
  \ {'path': '~/.local/share/nvim/wiki/wiki',
    \ 'path_html': '~/.local/share/nvim/wiki/html',
    \ 'sytnax': 'markdown',
    \ 'ext': '.md'
  \ }
\]

source ~/.dotfiles.local/init.vim
