return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require "cmp"
        local lspkind = require "lspkind"

        local kind_formatter = lspkind.cmp_format {
            mode = "symbol_text",
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]",
            },
        }

        cmp.setup {
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
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
                end
            },

            formatting = {
                fields = { "abbr", "kind", "menu" },
                expandable_indicator = true,
                format = kind_formatter,
            },
        }
    end
}
