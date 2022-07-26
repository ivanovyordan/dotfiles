local lspconfig = require("lspconfig")
local icons = require("icons")

-- Install Servers
require("mason").setup()
require("mason-lspconfig").setup {
    automatic_installation = true
}

-- Servers configuration
local servers = {
    bashls = {},
    dockerls = {},
    gopls = {},
    graphql = {},
    html = {},
    jsonls = {},
    pyright = {},
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim", "use" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = { enable = false },
            },
        },
    },
    terraformls = {},
    tsserver = {},
    vimls = {},
    yamlls = {},
}

for server, opts in pairs(servers) do
    lspconfig[server].setup(opts)
end


-- Diagnostics
vim.diagnostic.config({ virtual_text = false })
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

-- Key map
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format file before saving it",
    callback = vim.lsp.buf.formatting_sync,
})
