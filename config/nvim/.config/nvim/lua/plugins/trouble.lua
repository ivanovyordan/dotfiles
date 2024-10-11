return {
  'folke/trouble.nvim',
  opts = {},
  cmd = "Trouble",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    { '<leader>tt', "<cmd>Trouble diagnostics toggle<cr>", { desc = '[T]oggle [T]rouble diagnostic window' } },
    { '<leader>tb', "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = '[T]oggle [B]Buffer diagnostic window' } },
  }
}
