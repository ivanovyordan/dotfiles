local exec = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    -- Completion
    use {
        "williamboman/mason.nvim",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },
            { "mfussenegger/nvim-dap" },
        },
        run = ":MasonUpdate",
        config = function() require("plugins.lsp") end
    }

    use {
        "github/copilot.vim",
        config = function() require("plugins.copilot") end
    }

    use {
        "L3MON4D3/LuaSnip",
        requires = { "honza/vim-snippets" },
        config = function() require("plugins.luasnip") end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-path" },
            { "f3fora/cmp-spell" },
            { "neovim/nvim-lspconfig" },
            { "onsails/lspkind-nvim" },
        },
        config = function() require("plugins.cmp") end
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

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("plugins.indentline") end
    }

    use {
        "preservim/tagbar",
        config = function() require("plugins.tagbar") end
    }
    use {
        "folke/trouble.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function() require("plugins.trouble") end
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

    use {
        "simrat39/rust-tools.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function() require("rust-tools").setup() end
    }

    -- Colours
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins.treesitter") end
    }

    use { "Luxed/ayu-vim" }
    use { "projekt0n/github-nvim-theme" }
    use { "sam4llis/nvim-tundra" }


    -- Workflow
    use { "tpope/vim-eunuch" }
    use { "editorconfig/editorconfig-vim" }

    use {
        "TimUntersberger/neogit",
        requires = { "sindrets/diffview.nvim" },
        config = function() require("plugins.neogit") end
    }
end)
