local telescope = require("telescope")
local actions = require("telescope.actions")
local M = {}

telescope.setup {
    defaults = {
        color_devicons = true,
        vimgrep_arguments = {
            "rg",
            "--hidden",
            -- "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<c-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
    },
}

telescope.load_extension("fzf")

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end
    })
end


vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>Telescope find_files hidden=true<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-b>", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gbc", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true })

return M
