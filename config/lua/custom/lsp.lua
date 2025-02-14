local servers = {
    lua_ls = true,
    rust_analyzer = true,
    ocamllsp = true,
    nil_ls = true,
    zls = true,
    gopls = true,
}

local lspconfig = require("lspconfig")
require("mason").setup()
local ensure_installed = {}

local capabilities = nil

if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities()
end

for name, config in pairs(servers) do
    if config == true then
        config = {}
    end
    config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities,
    }, config)
    lspconfig[name].setup(config)
    table.insert(ensure_installed, name)
end

require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
    automatic_installation = false,
})

require("lazydev").setup {
    library = {
        "lazy.nvim"
    },
}

require("ocaml").setup {}
require("conform").setup {
    format_after_save = {
        lsp_format = "first"
    },
    notify_on_error = false,
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(_)
        local builtin = require "telescope.builtin"

        vim.keymap.set("n", "gd", builtin.lsp_definitions)
        vim.keymap.set("n", "gr", builtin.lsp_references)
        vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
        vim.keymap.set("n", "gi", builtin.lsp_implementations)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float)
    end
})
