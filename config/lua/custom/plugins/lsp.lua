return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "stevearc/conform.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")

        local servers = {
            rust_analyzer = true,
            gopls = true,
            ccls = true,
            zls = true,
            lua_ls = true,
        }

        for name, config in pairs(servers) do
            if config == true then
                config = {}
            end
            lspconfig[name].setup(config)
        end


        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
                vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { buffer = -1 })

                vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { buffer = 0 })
                vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { buffer = 0 })
                vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = 0 })
                vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { buffer = 0 })

                vim.keymap.set("n", "<leader>wd", function() Snacks.picker.lsp_symbols() end, { buffer = 0 })
                vim.keymap.set("n", "<leader>wD", function() Snacks.picker.lsp_workspace_symbols() end, { buffer = 0 })

                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
            end
        })

        require("conform").setup({
            format_after_save = {
                lsp_format = "prefer",
            },
        })
    end,
}
