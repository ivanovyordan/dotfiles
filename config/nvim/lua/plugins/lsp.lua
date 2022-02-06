local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "emmet_ls",
  "gopls",
  "graphql",
  "html",
  "json",
  "pyright",
  "solargraph",
  "sqls",
  "sumneko_lua",
  "tailwindcss",
  "terraformls",
  "tsserver",
  "vimls",
  "yamlls",
}


local custom_server_options = {
    ["yamlls"] = function(opts)
        opts.settings = {
            yaml = {
                schemas = {
                    ["https://gitlab.com/meltano/meltano/-/raw/master/schema/meltano.schema.json"] = "/meltano.yml",
                    ["https://gitlab.com/meltano/meltano/-/raw/master/schema/discovery.schema.json"] = "/meltano.yml",
                }
            },
        }
    end,
}


for i, server_name in ipairs(servers) do
  local ok, server = lsp_installer_servers.get_server(server_name)

  if ok then
    if not server:is_installed() then
      server:install()

      print(server_name .. " installed")
    end
  end
end


lsp_installer.on_server_ready(
  function(server)
    local opts = {}

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end
)


vim.diagnostic.config({virtual_text = false})
