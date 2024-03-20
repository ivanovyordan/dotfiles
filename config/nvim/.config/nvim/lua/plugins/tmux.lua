-- Move between tmux panes with vim keybindings
return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nvim_tmux_nav = require 'nvim-tmux-navigation'
    vim.keymap.set('n', '<c-h>', nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = 'Navigate to the left pane' })
    vim.keymap.set('n', '<c-j>', nvim_tmux_nav.NvimTmuxNavigateDown, { desc = 'Navigate to the bottom pane' })
    vim.keymap.set('n', '<c-k>', nvim_tmux_nav.NvimTmuxNavigateUp, { desc = 'Navigate to the top pane' })
    vim.keymap.set('n', '<c-l>', nvim_tmux_nav.NvimTmuxNavigateRight, { desc = 'Navigate to the right pane' })
  end
}
