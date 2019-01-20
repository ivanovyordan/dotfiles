set textwidth=100
set formatoptions+=t
set wrapmargin=2

let g:pandoc#folding#fold_yaml=1
let g:pandoc#folding#fold_fenced_codeblocks=1
let g:pandoc#filetypes#handled=['pandoc', 'markdown']
let g:pandoc#filetypes#pandoc_markdown=0
let g:pandoc#folding#mode=['syntax']
let g:pandoc#modules#enabled=['formatting', 'folding', 'toc']
let g:pandoc#formatting#mode='h'
let g:pandoc#syntax#codeblocks#embeds#langs=[
  \ 'console', 'sh',
  \ 'javascript', 'js=javascript', 'json=javascript',
  \ 'python',
\ ]

nnoremap <leader>th :ThesaurusQueryReplaceCurrentWord<cr>

DittoOn
