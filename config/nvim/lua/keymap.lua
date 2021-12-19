local opts = { noremap = true, silent = true }

-- Use Space as a leader
vim.api.nvim_set_keymap("n", "<space>", "<nop>", opts)
vim.g.mapleader = " "

-- use jk as escape
vim.api.nvim_set_keymap("i", "jk", "<esc>", opts)

-- Copy until the end of the row
vim.api.nvim_set_keymap("n", "Y", "y$", opts)

-- Find next/prev and keep the cursor vertically centred
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)

-- Concatenate lines and keep the cursor on the same position
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)

-- Keep cursor position when joining lines
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)
