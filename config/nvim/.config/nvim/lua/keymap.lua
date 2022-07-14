local opts = { noremap = true, silent = true }

-- Use Space as a leader
vim.keymap.set("n", "<space>", "<nop>", opts)
vim.g.mapleader = " "

-- use jk as escape
vim.keymap.set("i", "jk", "<esc>", opts)

-- Copy until the end of the row
vim.keymap.set("n", "Y", "y$", opts)

-- Find next/prev and keep the cursor vertically centred
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Concatenate lines and keep the cursor on the same position
vim.keymap.set("n", "J", "mzJ`z", opts)

-- Keep cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z", opts)
