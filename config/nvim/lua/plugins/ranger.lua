vim.g.ranger_map_keys = 0

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>Ranger<cr>", { noremap = true, silent = true })
