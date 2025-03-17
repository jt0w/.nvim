local cmp = require'cmp'

cmp.setup {
    sources = {
        {name = "nvim_lsp"},
        { name = 'nvim_lsp_signature_help' },
        {name = "luasnip"},
        {name = "path"},
        {name = "buffer"},
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
}
