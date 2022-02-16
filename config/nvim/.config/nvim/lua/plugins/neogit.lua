local neogit = require('neogit')

neogit.setup {
    disable_commit_confiramtion = true,
    integrations = {
        diffview = true
    }
}

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Neogit<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>Neogit log<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Neogit fetch<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>grom", "<cmd>Neogit rebase origin/master<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>grum", "<cmd>Neogit rebase upstream/master<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dv", "<cmd>DiffviewOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dm", "<cmd>DiffviewOpen master<cr>", { noremap = true, silent = true })
