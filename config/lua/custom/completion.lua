local lsp_kind = require "lspkind"
lsp_kind.init {
    mode = "text",
}

local cmp_formatter = lsp_kind.cmp_format {
    mode = "text",
    menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
    },
}

local cmp = require "cmp"

cmp.setup {
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "friendly_snippets" },
        { name = "path" },
        { name = "buffer" },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
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
    formatting = {
        fields = { "abbr", "kind", "menu" },
        expandable_indicator = true,
        format = cmp_formatter,
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}
