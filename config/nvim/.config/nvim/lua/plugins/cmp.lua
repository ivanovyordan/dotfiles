local cmp = require("cmp")
local lspkind = require("lspkind")
local icons = require("icons")

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    sources = {
        { name = "buffer" },
        { name = "cmdline" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",

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
                luanisp = icons.Snippet.icon,
                path = icons.Path.icon,
                buffer = icons.Lsp.icon,
                tmux = icons.Terminal.icon,
                spell = icons.Spell.icon,

            }),
        })
    },

    mapping = {
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<down>"] = cmp.mapping.select_next_item(),
        ["<up>"] = cmp.mapping.select_prev_item(),
        ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<c-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
    },

}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
