require("plugins.lsp.mason")
require("plugins.lsp.lsp_config")
require("plugins.lsp.null_ls")
require("plugins.lsp.diagnostic")


-- Autoformat on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  desc = "Format file before saving it",
  callback = function()
    if vim.bo.filetype ~= "yaml" then
      vim.lsp.buf.format()
    end
  end,
})

-- Key maps
local opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

-- Code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- More Info
vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>bd", vim.diagnostic.setqflist, opts)
