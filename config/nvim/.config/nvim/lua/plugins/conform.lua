-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      python = { 'isort', 'black' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
    },
    format_on_save = { timeout_ms = 500 },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
  },
}
