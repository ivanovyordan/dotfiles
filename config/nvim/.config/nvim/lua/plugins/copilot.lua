return {
  "github/copilot.vim",
  event = "VimEnter",
  config = function()
    vim.keymap.set('n', '<leader>cs', '<cmd>Copilot<cmd>', { desc = '[C]opilot [S]uggestions list' })
  end
}
