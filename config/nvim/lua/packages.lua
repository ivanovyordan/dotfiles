local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec("packadd packer.nvim")
end

exec("packadd packer.nvim")
cmd("autocmd BufWritePost packages.lua PackerCompile")

return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim", opt = true }

    -- Code faster
    use {
        "neovim/nvim-lspconfig",
        config = function() require("plugins.lsp") end
    }

    use {
        "glepnir/lspsaga.nvim",
        config = function() require("plugins.lspsaga") end
    }

    use {
        "onsails/lspkind-nvim",
        config = function() require("plugins.lspkind") end
    }

    use {
        "hrsh7th/nvim-compe",
        requires = {
            { "hrsh7th/vim-vsnip", config = function() require("plugins.vsnip") end },
            { "cstrap/python-snippets" },
            { "capaj/vscode-standardjs-snippets" },
        },
        config = function() require("plugins.compe") end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }

    use { "mattn/emmet-vim" }
    use { "editorconfig/editorconfig-vim" }

    -- Navigate faster
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
          { "nvim-lua/popup.nvim" },
          { "nvim-lua/plenary.nvim" },
          { "nvim-telescope/telescope-fzy-native.nvim" },
          { "nvim-telescope/telescope-media-files.nvim" },
          { "nvim-telescope/telescope-symbols.nvim" },
        },
        config = function() require("plugins.telescope") end
    }

    use {
        "phaazon/hop.nvim",
        config = function() require("plugins.hop") end
    }

    use { "christoomey/vim-tmux-navigator" }
    use { 
        "benmills/vimux",
        config = function() require("plugins.vimux") end
    }
    use { "tpope/vim-eunuch" }
    use { 
        "francoiscabrol/ranger.vim", 
        requires = { "rbgrouleff/bclose.vim" },
        config = function() require("plugins.ranger") end
    }

    -- Pretend being a writer
    use {
        "ron89/thesaurus_query.vim",
        cmd = "ThesaurusQueryReplaceCurrentWord",
        ft = { "markdown", "text", "gitcommit" },
        config = function() require("plugins.thesaurus") end
    }
    use {
        "davidgranstrom/nvim-markdown-preview",
        ft = { "markdown", "text", "gitcommit" }
    }

    -- Make it pretty
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup() end
    }
    use { 
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins.treesitter") end
    }
    use { "sheerun/vim-polyglot" }
 
    use { "sainnhe/sonokai" }
    use { "sainnhe/edge" }
    use { "marko-cerovac/material.nvim" }

    use { "mhinz/vim-startify" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "ryanoasis/vim-devicons" }
    use { "vim-airline/vim-airline" }
    use { "vim-airline/vim-airline-themes" }

    -- What is this thing???
    use {
        "tpope/vim-fugitive",
        config = function() require("plugins.fugitive") end
    }
end)
