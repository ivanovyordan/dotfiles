require("trouble").setup {
    use_diagnostic_signs = true,
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
