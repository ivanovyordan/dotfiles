" Enter in NORMAL mode with `j-k`
imap jk <Esc>

" Close buffer
nmap <C-d> :b#<bar>bd#<CR>

" easy window navigation
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
