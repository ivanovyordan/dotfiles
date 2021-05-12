local lspconfig = require("lspconfig")

lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.dockerls.setup {}
lspconfig.gopls.setup {}
lspconfig.jsonls.setup {}
lspconfig.pyright.setup {}
lspconfig.terraformls.setup {}
lspconfig.tsserver.setup {}
lspconfig.vimls.setup {}
lspconfig.yamlls.setup {}

lspconfig.graphql.setup {
    filetypes = { "graphql", "javascript" }
}

lspconfig.diagnosticls.setup {
    filetypes = {
       "css",
       "fish",
       "gitcommit",
       "html",
       "javascript",
       "json",
       "markdown",
       "python",
       "sh",
       "terraform",
       "vim",
    },
    init_options = {
       formatters = {
           black = { command = "black", args = { "--quiet", "-" } },
           fishIndent = { command = "fish_indent" },
           pandoc = { command = "pandoc", args = { "-t", "markdown" } },
           prettier = { command = "./node_modules/.bin/prettier", args = { "--stdin-filepath", "%filepath" } },
           shfmt = { command = "shfmt" },
           terraform = { command = "terraform", args = { "fmt", "-" } },
       },
       formatFiletypes = {
           css = "prettier",
           fish = "fishIndent",
           html = "prettier",
           javascript = "prettier",
           json = "prettier",
           lua = "luaFormat",
           markdown = "pandoc",
           python = "black",
           terraform = "terraform",
           yaml = "prettier",
       },
       linters = {
           eslint = {
               sourceName = "eslint",
               command = "./node_modules/.bin/eslint",
               debounce = 100,
               args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
               requiredFiles = { ".eslintrc.js", ".eslintrc.json" },
               parseJson = {
                   errorsRoot = "[0].messages",
                   sourceName = "filePath",
                   line = "line",
                   column = "column",
                   endLine = "endLine",
                   endColumn = "endColumn",
                   message = "${message} [${ruleId}]",
                   security = "severity",
               },
               securities = { ["2"] =  "error", ["1"] = "warning" },
           },
           fishLint = {
               sourceName = "fish",
               command = "fish",
               args = { "-n", "%file" },
               isStdout = false,
               isStderr = true,
               formatLines = 1,
               formatPattern = {
                   "^.*\\(line (\\d+)\\): (.*)$",
                   { line = 1, message = 2 },
               },
           },
           flake8 = {
               sourceName = "flake8",
               command = "flake8",
               debounce = 100,
               args = { "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s", "-" },
               offsetLine = 0,
               offsetColumn = 0,
               formatLines = 1,
               formatPattern = {
                   "(\\d+),(\\d+),({A-Z}),(.*)(\\r|\\n)*$",
                   { line = 1, column = 2, security = 3, message = 4 }
               },
               securities = {
                   W = "warning",
                   E = "error",
                   F = "error",
                   C = "error",
                   N = "error",
               },
           },
           languagetool = {
               sourceName = "languagetool",
               command = "languagetool",
               args = { "-l", "en-GB", "-" },
               debounce = 200,
               formatLines = 3,
               formatPattern = {
                   "^\\d+?\\.\\)\\s+Line\\s+(\\d+),\\s+column\\s+(\\d+),\\s+.*\\nMessage:\\s+(.*)(\\nSuggestion:\\s+.*)?.*$",
                   { line = 1, column = 2, message = { 3, 4 } },
                },
           },
           markdownlint = {
               sourceName = "markdownlint",
               command = "markdownlint",
               isStderr = true,
               debounce = 100,
               args = { "--stdin" },
               offsetLine = 0,
               offsetColumn = 0,
               formatLines = 1,
               formatPattern = {
                   "^.*?:\\s?(\\d+):?(\\d+)?\\s+MD\\d{3}\\/[\\w\\d\\-\\/]+\\s+(.*)$",
                   { line = 1, column = 2, message = 3 },
               },
           },
            shellcheck = {
                sourceName = "shellcheck",
                command = "shellcheck",
                args = { "--format", "json", "-" },
                debounce = 100,
                parseJson = {
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} { ${code} }",
                    security = "level",
                },
                securities = {
                    error = "error",
                    warning = "warning",
                    info = "info",
                    style = "hint",
                },
            },
            vint = {
                sourceName = "vint",
                command = os.getenv("HOME") .. "/.apps/pyenv/versions/neovim/bin/vint",
                args = { "--enable-neovim", "--style-problem", "--json", "-" },
                debounce = 100,
                parseJson = {
                    line = "line_number",
                    column = "column_number",
                    security = "severity",
                    message = "${description}",
                },
                securities = {
                    error = "error",
                    warning = "warning",
                    info = "info",
                    style = "hint",
                },
            },
            writeGood = {
                command = "npx",
                args = { "write-good", "--text", "%text" },
                debounce = 100,
                offsetLine = 0,
                offsetColumn = 1,
                sourceName = "write-good",
                formatLines = 1,
                formatPattern = {
                    "^(.*)\\s+on\\s+line\\s+(\\d+)\\s+at\\s+column\\s+(\\d+)$",
                    { line = 2, column = 3, message = 1 },
                },
            },
        },
        filetypes = {
            fish = { "fishLint" },
            gitcommit = { "languagetool", "writeGood" },
            javascript = { "eslint" },
            markdown = { "languagetool", "markdownlint", "writeGood" },
            python = { "flake8" },
            sh = { "shellcheck" },
            vim = { "vint" },
        },
    },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>df", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", { noremap = true, silent = true })
