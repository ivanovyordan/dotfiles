local mason = require("mason")
local registry = require("mason-registry")
local packages = require("plugins.lsp.packages")

mason.setup()


local function install_package(package_name)
    if not registry.has_package(package_name) then
        print("Package " .. package_name .. " not found")
        return
    end

    local package = registry.get_package(package_name)
    if not package:is_installed() then
        package:install()
        print("Installed Mason Package " .. package_name)
    end
end

for package_name, _ in pairs(packages.lsp) do
    install_package(package_name)
end

for package_name, _ in pairs(packages.null_ls) do
    install_package(package_name)
end

for package_name, _ in pairs(packages.dap) do
    install_package(package_name)
end
