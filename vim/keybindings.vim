" Enter in NORMAL mode with `j-k`
imap jk <Esc>

" Clear search highlighting
noremap <CR> :nohl<cr>

" Better navigation in splits
noremap j gj
noremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Vimfiler
nmap <F3> :VimFilerExplorer<CR>

" Tagbar
nmap <F2> :TagbarToggle<CR>

" NERD Commenter
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

" fzf
noremap <C-b> :Buffers<CR>
noremap <C-p> :Files<CR>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" neosnippet
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)
xmap <C-Space> <Plug>(neosnippet_expand_target)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

function! ExpandOrEnter()
  if neosnippet#expandable_or_jumpable()
    return neosnippet#mappings#expand_or_jump_impl()
  elseif pumvisible()
    return deoplete#mappings#close_popup()
  else
    return "\<Return>"
  endif
endfunction

inoremap <Return> <C-R>=ExpandOrEnter()<CR>

if has('conceal')                        " Hide snippet marks
    set conceallevel=2 concealcursor=niv
endif
