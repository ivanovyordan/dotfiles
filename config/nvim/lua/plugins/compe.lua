require("compe").setup {
    source = {
        buffer = {kind = "  "},
        calc = {kind = "  "},
        emoji = {kind = " ﲃ ", filetypes={"markdown"}},
        nvim_lsp = {kind = "  "},
        nvim_lua = {kind = "  "},
        path = {kind = "  "},
        spell = {kind = "  "},
        tabnine = { kind = " ⌾ " },
        treesitter = {kind = "  "},
        vsnip = {kind = "  "},
    };
}

vim.api.nvim_set_keymap("i", "<cr>", "compe#confirm('<cr>')", { noremap = true, silent = true, expr = true })
