require("nvim-lsp-installer").setup {
    automatic_installation = true,
}

require("navigator").setup {
    lsp_installer = true,
    lsp = {
        efm = {
            settings = {
                init_options = {
                    documentFormatting = true,
                },
                languages = {
                    sql = {
                        {
                            lintSource = "sqlfluff",
                            lintCommand = "sqlfluff lint --format github-annotation --nofail --disable_progress_bar ${INPUT} | jq -cM '.[]'",
                            lintStdin = false,
                            lintFormats = {
                                '{"file":"%f","line":%l,"start_column":%c,"end_column":%.%#,"title":"SQLFluff","message":"L%n: %m","annotation_level":"%.%#"}',
                            },
                        },
                        {
                            formatCommand = "sqlfluff fix --force --disable_progress_bar ${INPUT}",
                            formatStdin = false,
                        },
                    },
                },
            },
            filetypes = { "sql" },
            single_file_support = false,
        },
    },
}
