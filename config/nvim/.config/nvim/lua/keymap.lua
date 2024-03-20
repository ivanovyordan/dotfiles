-- Set leader to space
vim.g.mapleader = ' '
-- Set local leader to space
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<esc>', { desc = 'Use jk to escape' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear highlights' })
