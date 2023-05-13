local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local packages = require("plugins.lsp.packages")


mason_lspconfig.setup()

for _, opts in pairs(packages.lsp) do
    local name = opts[1]
    local config = opts[2]

    lspconfig[name].setup(config)
end
