local icons = require("icons")
local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga {
  diagnostic_header = {
    icons.Error.icon,
    icons.Warn.icon,
    icons.Information.icon,
    icons.Hint.icon
  },
  code_action_icon = icons.CodeAction.icon,
  code_action_lightbulb = { virtual_text = false },
  finder_icons = {
    def = icons.Definition.icon,
    ref = icons.Reference.icon,
    link = icons.Link.icon,
  }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>Lspsaga range_code_action<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>hm", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
