" Startify
let g:startify_list_order = [
  \ ['   My most recently used files in the current directory:'],
  \ 'dir',
  \ ['   My most recently used files:'],
  \ 'files',
  \ ['   These are my sessions:'],
  \ 'sessions',
  \ ['   These are my bookmarks:'],
  \ 'bookmarks',
\ ]

" fzf
set rtp+=~/.fzf
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:40%'), <bang>0)
command! -bang -nargs=* Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:40%'), <bang>0)

" Vimfiler
let g:vimfiler_as_default_explorer=1

" Airline
set linespace=0
set noshowmode
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1

" Dev icons
set guifont=RobotoMono\ Nerd\ Font\ 12

" Identline
let g:indentLine_fileTypeExclude = ['help', 'man', 'startify', 'vimfiler']

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_quiet_messages={ "level": "warnings" }

" deoplete
let g:deoplete#enable_at_startup=1
autocmd CompleteDone * silent! pclose!

" Neosnippet
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" deoplete-ternjs
let g:deoplete#sources#ternjs#types=1

" vim-palette
if (has('termguicolors'))
  set termguicolors
endif
colorscheme base16-gruvbox-dark-medium
