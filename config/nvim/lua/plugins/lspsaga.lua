local saga = require("lspsaga")

saga.init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    dianostic_header_icon = "  ",
    code_action_icon = "",
}

vim.api.nvim_set_keymap("n", "gdn", "<cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gdp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-c>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>Lspsaga range_code_action<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hd", "<cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sh", "<cmd>Lspsaga signature_help<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>pd", "<cmd>Lspsaga preview_definition<cr>", { noremap = true, silent = true })
