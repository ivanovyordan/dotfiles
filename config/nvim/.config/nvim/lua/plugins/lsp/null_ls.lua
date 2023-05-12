local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local registry = require("mason-registry")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local installed_packages = registry.get_installed_packages()
local null_ls_sources = {}

for _, package in pairs(installed_packages) do
    if package.spec.categories[1] == "Formatter" then
        table.insert(null_ls_sources, formatting[package.name])
    elseif package.spec.categories[1] == "Linter" then
        table.insert(null_ls_sources, diagnostics[package.name])
    end
end


null_ls.setup {
    debug = false,
    sources = null_ls_sources,
}


null_ls.register({
    {
        name = "sqlfluff",
        method = null_ls.methods.FORMATTING,
        filetypes = { "sql" },
        generator = helpers.formatter_factory({
            command = "sqlfluff",
            args = {
                "fix",
                "--force",
                "--nocolor",
                "--disable_progress_bar",
                "$FILENAME"
            },
            timeout = 20000,
        }),
    },
})
