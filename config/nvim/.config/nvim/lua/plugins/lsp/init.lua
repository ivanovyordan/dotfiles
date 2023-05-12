require("plugins.lsp.mason")
require("plugins.lsp.lsp_config")
require("plugins.lsp.null_ls")

local icons = require("icons")


-- Diagnostics UI
local signs = {
    Info = icons.Information.icon,
    Hint = icons.Hint.icon,
    Warn = icons.Warn.icon,
    Error = icons.Error.icon,
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Autoformat on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = { "*" },
--     desc = "Format file before saving it",
--     callback = function() vim.lsp.buf.format() end,
-- })
--
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
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)

-- More Info
vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>bd", vim.diagnostic.setqflist, opts)
