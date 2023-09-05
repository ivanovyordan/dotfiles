local dbt = require("dbtpal")

dbt.setup {
    path_to_dbt = "dbt",
    path_to_dbt_project = "",
    path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
    extended_path_search = true,
    protect_compiled_files = true
}

require'telescope'.load_extension("dbtpal")
