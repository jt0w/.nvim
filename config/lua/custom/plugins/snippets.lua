return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local ls = require("luasnip")

        ls.config.set_config {
            history = true,
            override_builtin = true,
        }

        -- will exclude all javascript snippets
        require("luasnip.loaders.from_vscode").load {}

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
        end, { silent = true })
    end
}
