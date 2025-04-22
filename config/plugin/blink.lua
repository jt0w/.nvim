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
