return {
  'folke/trouble.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    { '<leader>tt', "<cmd>TroubleToggle<cr>", { desc = '[T]oggle [T]rouble diagnostic window' } },
  }
}
