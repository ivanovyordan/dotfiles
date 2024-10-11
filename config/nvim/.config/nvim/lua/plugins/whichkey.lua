-- Display a popup with possible keybindings
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require('which-key')
    wk.setup()

    wk.add({
      { "<leader>f", group = "[C]ode" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]roubles" },
    })
  end,
}
