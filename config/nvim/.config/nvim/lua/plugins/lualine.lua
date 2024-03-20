return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local navic = require('nvim-navic')

    require('lualine').setup({
      sections = {
        lualine_c = {
          "filename",
          {
            navic.get_location,
            cond = navic.is_available
          },
        },
      },
    })
  end
}
