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

for i, server_name in ipairs(servers) do
  local ok, server = lsp_installer_servers.get_server(server_name)

  if ok then
    if not server:is_installed() then
      server:install()

      print(server_name .. " installed")
    end
  end
end

require("navigator").setup {
    lsp_installer = true,
    lsp = {
        diagnostic_virtual_text = false,
    },
    icons = {
        code_action_icon = "",
        code_lens_action_icon = "🔍",

        diagnostic_head = "",
        diagnostic_err = "",
        diagnostic_warn = "",
        diagnostic_info = "",
        diagnostic_hint = "",
    }
}
