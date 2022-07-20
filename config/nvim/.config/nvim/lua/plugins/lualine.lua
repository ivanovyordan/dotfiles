local navic = require("nvim-navic")
local icons = require("icons")

navic.setup {
  icons = {
    ["class-name"] = icons.Class.icon,
    ["function-name"] = icons.Function.icon,
    ["method-name"] = icons.Method.icon,
    ["container-name"] = icons.Constant.icon,
    ["tag-name"] = icons.Tag.icon,
  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}

require("lualine").setup {
  sections = {
    lualine_c = {
      "filename",
      {
        navic.get_location,
        cond = navic.is_available
      },
    },
  },
}
