return {
    "blink.cmp",
    lazy = false,
    before = function()
        deps.add({
            source = "saghen/blink.cmp",
            depends = {
                "rafamadriz/friendly-snippets",
            },
            checkout = "v0.12.0", -- check releases for latest tag
        })
    end,
    after = function()
        require("blink.cmp").setup {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            completion = {
                menu = {
                    auto_show = true,

                    -- nvim-cmp style menu
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 1 }
                        },
                    }

                },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
            },

        }
        require "custom.snippets"
    end
}
