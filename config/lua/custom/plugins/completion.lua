return {
    "nvim-cmp",
    lazy = false,
    before = function()
        deps.add {
            source = "hrsh7th/nvim-cmp",
            depends = {
                "onsails/lspkind.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip"
            },
        }
    end,
    after = function()
        require "custom.completion"
    end
}
