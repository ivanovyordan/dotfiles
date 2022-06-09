local icons = require("icons")
local lspsaga = require("lspsaga")

lspsaga.setup {
  error_sign = icons.Error.icon,
  warn_sign = icons.Warn.icon,
  hint_sign = icons.Hint.icon,
  infor_sign = icons.Information.icon,
  diagnostic_header_icon = icons.Diagnostic.icon,
  code_action_icon = icons.CodeAction.icon,
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>Lspsaga range_code_action<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>hm", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
