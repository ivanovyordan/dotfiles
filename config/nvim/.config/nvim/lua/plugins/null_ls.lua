local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions


null_ls.setup {
    debug = true,
    sources = {
        -- General
        formatting.prettier.with({filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "markdown",
            "scss",
            "sql",
            "typescript",
            "typescriptreact",
            "yaml",
        }}),
        formatting.trim_newlines,
        formatting.trim_whitespace,
        code_actions.gitsigns,
        code_actions.refactoring,

        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        formatting.black,
        formatting.isort,

        -- Golang
        formatting.gofmt,
        formatting.goimports,

        -- Shell
        formatting.fish_indent,
        formatting.shfmt,
        code_actions.shellcheck,
        diagnostics.shellcheck,

        -- Terraform
        formatting.terraform_fmt,

        -- Writing
        diagnostics.markdownlint,
        diagnostics.proselint,
        diagnostics.write_good,
        code_actions.proselint,
    },
    -- on_attach = function(client)
    --     if client.resolved_capabilities.document_formatting then
    --         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    --     end
    -- end,
}


local sqlfluff = {
    name = "sqlfluff",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "sql" },

    generator = null_ls.generator({
        command = "sqlfluff",
        args = {
            "lint",
            "--nocolor",
            "--disable_progress_bar",
            "$FILENAME",
        },
        timeout = 20000,
        to_stdin = false,
        from_stderr = true,
        format = "line",
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = [[^L:%s*(%d+)%s*|%s*P:%s*(%d+)%s*|%s*L%s*(%d+)%s*|%s*(.*)$]],
                groups = { "row", "col", "code", "message" },
            },
            {
                pattern = [[^L:%s*(%d+)%s*|%s*P:%s*(%d+)%s*|%s*(PRS)%s*|%s*(.*)$]],
                groups = { "row", "col", "code", "message" },
            },
        }),
    }),
}
null_ls.register({ sqlfluff })
