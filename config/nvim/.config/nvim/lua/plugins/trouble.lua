require("trouble").setup {
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
