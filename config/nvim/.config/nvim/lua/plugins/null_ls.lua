local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
    debug = false,
    sources = {
        -- General
        code_actions.gitsigns,
        -- code_actions.refactoring,

        formatting.prettier.with({
            extra_args = { "--fast" },
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "json",
                "yaml",
            },
        }),

        -- Shell
        diagnostics.fish,
        diagnostics.shellcheck,
        formatting.fish_indent,

        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        formatting.black,

        -- Prose
        diagnostics.alex,
        diagnostics.markdownlint,
        diagnostics.write_good,
    },
}

null_ls.register({
    -- {
    --     name = "sqlfluff",
    --     method = null_ls.methods.DIAGNOSTICS,
    --     filetypes = { "sql" },
    --     generator = null_ls.generator({
    --         command = "sqlfluff",
    --         args = {
    --             "lint",
    --             "--format",
    --             "github-annotation",
    --             "--nofail",
    --             "--disable_progress_bar",
    --             "$FILENAME",
    --         },
    --         timeout = 20000,
    --         -- to_stdin = false,
    --         -- from_stderr = true,
    --         -- format = "json",
    --         -- on_output = helpers.diagnostics.from_json({
    --         --     attributes = {
    --         --         row = "line",
    --         --         col = "start_column",
    --         --         end_col = "end_column",
    --         --         code = "ruleId",
    --         --         severity = "annotation_level",
    --         --         message = "message",
    --         --     }
    --         -- })
    --         format = "line",
    --         on_output = helpers.diagnostics.from_patterns({
    --             {
    --                 pattern = [[^L:%s*(%d+)%s*|%s*P:%s*(%d+)%s*|%s*L%s*(%d+)%s*|%s*(.*)$]],
    --                 groups = { "row", "col", "code", "message" },
    --             },
    --             {
    --                 pattern = [[^L:%s*(%d+)%s*|%s*P:%s*(%d+)%s*|%s*(PRS)%s*|%s*(.*)$]],
    --                 groups = { "row", "col", "code", "message" },
    --             },
    --         }),
    --     }),
    -- },
    {
        name = "sqlfluff",
        method = null_ls.methods.FORMATTING,
        filetypes = { "sql" },
        generator = helpers.formatter_factory({
            command = "sqlfluff",
            args = {
                "fix",
                "--force",
                "--nocolor",
                "--disable_progress_bar",
                "$FILENAME"
            },
            timeout = 20000,
        }),
    },
})
