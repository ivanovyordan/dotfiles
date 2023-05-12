local mason = require("mason")
local registry = require("mason-registry")
local packages = require("plugins.lsp.packages")

mason.setup()

-- Install missing servers
local all_packages = registry.get_all_packages()

for _, package in pairs(all_packages) do
    local in_lsp = packages.lsp[package.name] ~= nil
    local in_null_ls = packages.null_ls[package.name] ~= nil
    local in_spec = in_lsp or in_null_ls

    if in_spec and not package:is_installed() then
        package:install()
        print("Installed Mason Package " .. package.name)
    end

    if not in_spec and package:is_installed() then
        package:uninstall()
        print("Removed Mason Package " .. package.name)
    end
end
