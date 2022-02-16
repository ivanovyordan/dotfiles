local cmp = require("cmp")
local lspkind = require("lspkind")
local icons = require("icons")

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = {
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<down>"] = cmp.mapping.select_next_item(),
        ["<up>"] = cmp.mapping.select_prev_item(),
        ["<c-j>"] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<c-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = 'vsnip' },
        { name = "path" },
        { name = "buffer" },
        { name = "tmux" },
        { name = "spell" },
    },

    formatting = {
        format = lspkind.cmp_format({
            symbol_map = {
                Class = icons.Class.icon,
                Color = icons.Color.icon,
                Constant = icons.Constant.icon,
                Constructor = icons.Constructor.icon,
                Enum = icons.Enum.icon,
                EnumMember = icons.EnumMember.icon,
                Event = icons.Event.icon,
                Field = icons.Field.icon,
                File = icons.File.icon,
                Folder = icons.Folder.icon,
                Function = icons.Function.icon,
                Interface = icons.Interface.icon,
                Keyword = icons.Key.icon,
                Method = icons.Method.icon,
                Module = icons.Module.icon,
                Operator = icons.Operator.icon,
                Property = icons.Property.icon,
                Reference = icons.Reference.icon,
                Snippet = icons.Snippet.icon,
                Struct = icons.Struct.icon,
                Text = icons.String.icon,
                TypeParameter = icons.TypeParameter.icon,
                Unit = icons.Unit.icon,
                Value = icons.Value.icon,
                Variable = icons.Variable.icon,
            },

            menu = ({
                nvim_lsp = icons.Lsp.icon,
                nvim_lua = icons.Lsp.icon,
                vsnip = icons.Snippet.icon,
                path = icons.Path.icon,
                buffer = icons.Lsp.icon,
                tmux = icons.Terminal.icon,
                spell = icons.Spell.icon,

            }),
        })
    },
}
