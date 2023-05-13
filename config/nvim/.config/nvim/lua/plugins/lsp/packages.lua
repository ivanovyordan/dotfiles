-- Servers config
local lsp_packages = {
    ["bash-language-server"] = { "bashls", {} },
    ["dockerfile-language-server"] = { "dockerls", {} },
    ["pyright"] = { "pyright", {} },
    ["lua-language-server"] = { "lua_ls", {} },
    ["rust-analyzer"] = { "rust_analyzer", {} },
    ["terraform-ls"] = { "terraformls", {} },
    ["typescript-language-server"] = { "tsserver", {} },
    ["yaml-language-server"] = { "yamlls", {
        settings = {
            yaml = {
                schemas = {
                    ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_yml_files.json"] = {
                        "/models/**/*.yml",
                        "/models/schema.yml"
                    },
                    ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_project.json"] = {
                        "dbt_project.yml"
                    },
                    ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/selectors.json"] = {
                        "selectors.yml"
                    },
                    ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/packages.json"] = {
                        "packages.yml"
                    },
                    ["https://raw.githubusercontent.com/meltano/meltano/master/src/meltano/schemas/meltano.schema.json"] = {
                        "*meltano.yml"
                    }
                }
            }
        }
    } }
}

local null_ls_packages = {
    ["black"] = {},
    ["flake8"] = {},
    ["gitlint"] = {},
    ["isort"] = {},
    ["jq"] = {},
    ["mypy"] = {},
    ["prettier"] = {},
    ["shellcheck"] = {}
}

local nvim_dap = {
    ["codelldb"] = { "rust", {} }
}

local pakcages = {
    lsp = lsp_packages,
    null_ls = null_ls_packages,
    dap = nvim_dap,
}


return pakcages
