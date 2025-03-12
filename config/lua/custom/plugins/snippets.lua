return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    lazy = false,
    config = function()
        local ls = require("luasnip")

        ls.config.set_config {
            history = true,
            override_builtin = true,
        }
        -- will exclude all javascript snippets
        require("luasnip.loaders.from_vscode").lazy_load {}
        vim.keymap.set({ "i" }, "<c-k>", function() ls.expand_or_jump() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<c-j>", function() ls.jump(-1) end, { silent = true })
    end
}
