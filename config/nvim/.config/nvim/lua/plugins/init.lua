local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.autopairs',
  require 'plugins.cmp',
  require 'plugins.comments',
  require 'plugins.conform',
  require 'plugins.copilot',
  require 'plugins.eunuch',
  require 'plugins.gitsigns',
  require 'plugins.indentline',
  require 'plugins.lsp',
  require 'plugins.lualine',
  require 'plugins.noice',
  require 'plugins.sleuth',
  require 'plugins.telescope',
  require 'plugins.theme',
  require 'plugins.todo',
  require 'plugins.treesitter',
  require 'plugins.trouble',
  require 'plugins.whichkey',
}
