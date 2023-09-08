local trouble = require("trouble")

trouble.setup {}

vim.keymap.set("n", "<space>td", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })
