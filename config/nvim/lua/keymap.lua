-- Use Space as a leader
vim.api.nvim_set_keymap("n", "<space>", "<nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- use jk as escape
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true, silent = true })

-- Copy until the end of the row
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

-- Find next/prev and keep the cursor vertially centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Concatenate lines and keep the cursor on the same position
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

--
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
