syntax on

set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

" Set default split
set splitright
set splitbelow

" System-wide clipboard
set clipboard+=unnamedplus

" Use a POSIX shell inside vim
set shell=bash

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Change leader
let mapleader=' '
" Set Python path
let g:python3_host_prog=$HOME . '/.apps/pyenv/versions/neovim/bin/python'

" coc
let g:coc_global_extensions=[
  \ 'coc-word',
  \ 'coc-git',
  \ 'coc-html', 'coc-emmet',
  \ 'coc-vimlsp',
  \ 'coc-python',
  \ 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-graphql', 'coc-react-refactor',
  \ 'coc-snippets',
  \ 'coc-diagnostic',
\]

call plug#begin('~/.vim/plugged')
  " Make it pretty
  Plug 'chriskempson/base16-vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'phanviet/vim-monokai-pro'
  Plug 'doums/darcula'
  Plug 'joshdick/onedark.vim'
  Plug 'hzchirs/vim-material'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

  " Navigate faster
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim' | Plug 'stsewd/fzf-checkout.vim'
  Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim'
  Plug 'christoomey/vim-tmux-navigator' | Plug 'benmills/vimux'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-eunuch'

  " Code faster
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'jsx']}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dbeniamine/cheat.sh-vim'
  Plug 'puremourning/vimspector' | Plug 'szw/vim-maximizer'

  " Pretend being a write
  Plug 'ron89/thesaurus_query.vim', {'for': ['markdown', 'text', 'gitcommit']}
  Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'text', 'gitcommit'], 'do': 'cd app & yarn install'}
  Plug 'dbmrq/vim-ditto', {'for': ['markdown', 'text', 'gitcommit']}

  " Other wierd use-cases
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  Plug $HOME . '/workspace/stuff/dbt.vim', {'for': 'sql'}
call plug#end()

" Strip trailing white space
autocmd BufWritePre * %s/\s\+$//e

" Set color scheme
try
  let base16colorspace=256
  let ayucolor='mirage'
  colorscheme ayu
catch
  colorscheme slate
endtry

" Keyboard shortcuts
" Enter in NORMAL mode with `j-k`
imap jk <esc>

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

" Airline
let g:airline_powerline_fonts=1

" Fugitive
noremap <leader>gs :G<cr>
noremap <leader>gc :GCheckout<cr>

noremap <leader>gl :diffget //2<cr>
noremap <leader>gh :diffget //3<cr>

" fzf config
noremap <c-b> :Buffers<cr>
noremap <c-p> :Files<cr>
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

" Vimux
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vl :VimuxRunLastCommand<cr>
map <leader>vi :VimuxInspectRunner<cr>
map <leader>vq :VimuxCloseRunner<cr>
map <leader>vs :VimuxInterruptRunner<cr>
map <leader>vz :VimuxZoomRunner<cr>

" Call Ranger
map <leader>f :Ranger<cr>

" Cheat Sheet
let g:CheatSheetDoNotMap=1

" Undotree
nnoremap <leader>u :UndotreeShow<cr>

" Polyglot
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" CoC
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" use `:Imports` for organize import of current buffer
command! -nargs=0 Imports :call CocAction('runCommand', 'editor.action.organizeImport')

" CoC actions
nnoremap <silent><nowait> <space>c :<c-u>CocList commands<cr>
nnoremap <silent><nowait> <space>e :<c-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>p :<c-u>CocListResume<cr>

" Buffer actions
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rf <Plug>(coc-refactor)
nmap <leader>o :<c-u>CocList outline<cr>
nmap <leader>s :<c-u>CocList -I symbols<cr>
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Selected text
xmap <leader>ac <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction-selected)
xmap <leader>fo <Plug>(coc-format-selected)
nmap <leader>fo <Plug>(coc-format-selected)

" Word under cursor
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <c-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Vim maximize
nnoremap <leader>mt :MaximizerToggle!<cr>

" Vimspector
nnoremap <leader>ds :call vimspector#Launch()<cr>
nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<cr>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<cr>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<cr>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<cr>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<cr>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<cr>
nnoremap <leader>de :call vimspector#Reset()<cr>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<cr>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" Writing
let g:languagetool_lang='en-GB'
nnoremap <leader>th :ThesaurusQueryReplaceCurrentWord<cr>

" DBT
let g:dbt_autostart=0
let g:dbt_host='127.0.0.1'
let g:dbt_path='run staging dbt'
let g:dbt_compile_on_open=0
let g:dbt_compile_on_save=0

map <leader>dc :DbtCompileSql<cr>
