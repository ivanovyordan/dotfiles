require("nvim-treesitter.configs").setup {
    indent = { enable = true },
    highlight = { enable = true },
    ensure_installed = "maintained"
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = vim.fn["nvim_treesitter#foldexpr"]()
