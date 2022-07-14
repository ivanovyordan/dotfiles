local neogit = require('neogit')

neogit.setup {
    disable_commit_confiramtion = true,
    integrations = {
        diffview = true
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", opts)
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<cr>", opts)
vim.keymap.set("n", "<leader>gf", "<cmd>Neogit fetch<cr>", opts)
vim.keymap.set("n", "<leader>grom", "<cmd>Neogit rebase origin/master<cr>", opts)
vim.keymap.set("n", "<leader>grum", "<cmd>Neogit rebase upstream/master<cr>", opts)

vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>", opts)
vim.keymap.set("n", "<leader>dm", "<cmd>DiffviewOpen master<cr>", opts)
