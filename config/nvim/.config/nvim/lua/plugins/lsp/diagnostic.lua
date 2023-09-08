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
