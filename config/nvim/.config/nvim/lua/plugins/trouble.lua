local trouble = require("trouble")
local icons = require("icons")

trouble.setup({
    signs = {
        error = icons.Error.icon,
        warning = icons.Warn.icon,
        hint = icons.Hint.icon,
        information = icons.Information.icon,
        other = icons.Diagnostic.icon,
    },
})

vim.keymap.set("n", "<space>td", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })
