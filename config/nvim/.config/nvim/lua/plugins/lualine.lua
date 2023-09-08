local navic = require("nvim-navic")

navic.setup {
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
