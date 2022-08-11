require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup {
    indent = { enable = true },
    highlight = { enable = true },
    auto_install = true,
}
