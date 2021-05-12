vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"

vim.cmd("imap <expr><c-j> vsnip#available(1) ? '<plug>(vsnip-expand-or-jump)' : '<c-j>'")
vim.cmd("smap <expr><c-j> vsnip#available(1) ? '<plug>(vsnip-expand-or-jump)' : '<c-j>'")
