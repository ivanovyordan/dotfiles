local icons = require("icons")

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

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = { "*" },
    desc = "Show autodiagnostic popup on cursor hover_range",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})
