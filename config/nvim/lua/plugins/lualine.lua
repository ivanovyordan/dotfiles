local gps = require("nvim-gps")
local icons = require("icons")

gps.setup {
  icons = {
    ["class-name"] = icons.Class.icon,
    ["function-name"] = icons.Function.icon,
    ["method-name"] = icons.Method.icon,
    ["container-name"] = icons.Constant.icon,
    ["tag-name"] = icons.Tag.icon,
  },
}

require("lualine").setup {
  sections = {
    lualine_c = {
      "filename",
      {
        gps.get_location,
        cond = gps.is_available
      },
    },
  },
}
