local light = false

vim.g.sonokai_style = "default"
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1

vim.g.edge_style = "light"
vim.g.edge_enable_italic = 1
vim.g.edge_disable_italic_comment = 1

-- vim.g.ayucolor = "dark"

if light then
    vim.o.background = "light"
else
    vim.o.background = "dark"
end

vim.cmd("colorscheme ayu")