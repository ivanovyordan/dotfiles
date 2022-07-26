local exec = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }
    use { "nathom/filetype.nvim" }

    -- Completion
    use {
        "williamboman/mason.nvim",
        requires = {
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
        },
        config = function() require("plugins.lsp") end
    }

    use {
        "L3MON4D3/LuaSnip",
        requires = { "honza/vim-snippets" },
        config = function() require("plugins.luasnip") end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "onsails/lspkind-nvim" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-path" },
            { "f3fora/cmp-spell" },
        },
        config = function() require("plugins.cmp") end
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "jose-elias-alvarez/null-ls.nvim" },
        config = function() require("plugins.null_ls") end
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = function() require("plugins.lsp_signature") end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }

    -- Navigations
    use { "christoomey/vim-tmux-navigator" }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "kyazdani42/nvim-web-devicons" },

        },
        config = function() require("plugins.telescope") end
    }


    -- UI
    use {
        "glepnir/lspsaga.nvim",
        requires = { "neovim/nvim-lspconfig" },
        config = function() require("plugins.lspsaga") end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("plugins.indentline") end
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            { "SmiteshP/nvim-navic" },
            { "neovim/nvim-lspconfig" },
        },
        config = function() require("plugins.lualine") end
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("plugins.gitsigns") end
    }

    -- Colours
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins.treesitter") end
    }

    use { "Luxed/ayu-vim" }
    use { "projekt0n/github-nvim-theme" }


    -- Workflow
    use { "tpope/vim-eunuch" }
    use { "editorconfig/editorconfig-vim" }

    use {
        "TimUntersberger/neogit",
        requires = { "sindrets/diffview.nvim" },
        config = function() require("plugins.neogit") end
    }


    -- Utility
    use {
        "lewis6991/spellsitter.nvim",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = function() require("spellsitter").setup() end
    }
end)
