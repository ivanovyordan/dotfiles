local telescope = require("telescope")
local actions = require("telescope.actions")
local M = {}

telescope.setup {
    defaults = {
        color_devicons = true,
        vimgrep_arguments = {
            "rg",
            "--hidden",
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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files hidden=true<cr>", opts)
vim.keymap.set("n", "<c-b>", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope lsp_references<cr>", opts)
vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", opts)

vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
vim.keymap.set("n", "<leader>gbc", "<cmd>Telescope git_bcommits<cr>", opts)

vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<cr>', opts)

return M
