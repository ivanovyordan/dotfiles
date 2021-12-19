local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    use { "nathom/filetype.nvim"}
    use { "nvim-lua/plenary.nvim" }
    use { "kyazdani42/nvim-web-devicons" }


    -- Completion
    use { "github/copilot.vim" }

    use {
        "williamboman/nvim-lsp-installer",
        requires = { "neovim/nvim-lspconfig" },
        config = function() require("plugins.lsp") end
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = function() require("plugins.lsp_signature") end
    }

    use {
        "hrsh7th/vim-vsnip",
        requires = { "rafamadriz/friendly-snippets" }
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "onsails/lspkind-nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lua" },
            { "andersevenrud/cmp-tmux" },
            { "f3fora/cmp-spell" },
        },
        config = function() require("plugins.cmp") end
    }

    use {
        "tami5/lspsaga.nvim",
        config = function() require("plugins.lspsaga") end
    }

    use { "mattn/emmet-vim" }
    use {
        "windwp/nvim-ts-autotag",
        config = function() require("nvim-ts-autotag").setup() end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("plugins.null_ls") end
    }

    -- Navigations
    use { "christoomey/vim-tmux-navigator" }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function() require("plugins.telescope") end
    }

    use {
        "francoiscabrol/ranger.vim",
        requires = { "rbgrouleff/bclose.vim" },
        config = function() require("plugins.ranger") end
    }


    -- UI
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function () require("plugins.indentline")  end
    }

    use {
        "folke/trouble.nvim",
        config = function() require("plugins.trouble") end
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "SmiteshP/nvim-gps" },
        config = function() require("plugins.lualine") end
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("plugins.gitsigns")  end
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
end)
