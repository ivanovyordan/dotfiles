local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")


local function setup_servers()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, server in pairs(servers) do
      lspconfig[server].setup{}
    end
end

setup_servers()
lspinstall.post_install_hook = function ()
  setup_servers()
  vim.cmd("bufdo e")
end
