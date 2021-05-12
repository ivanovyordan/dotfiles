vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>G<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Git fetch --all<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>grum", "<cmd>Git rebase upstream/master<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>grom", "<cmd>Git rebase origin/master<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gdl", "<cmd>diffget //2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gdh", "<cmd>diffget //3<cr>", { noremap = true, silent = true })
