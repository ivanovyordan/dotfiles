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
        lualine_x = {
          {
            function()
              return 'A'
            end,
            color = { fg = '#8FBCBB' }, -- green
            cond = function()
              return _G.aider_background_status == 'idle'
            end
          },
          {
            function()
              return 'A'
            end,
            color = { fg = '#BF616A' }, -- red
            cond = function()
              return _G.aider_background_status == 'working'
            end
          }
        },
      },
    })
  end
}
