vim.g.languagetool_lang = "en-GB"

vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>ThesaurusQueryReplaceCurrentWord<cr>", { noremap = true, silent = true})
