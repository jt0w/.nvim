local servers = {
    lua_ls = true,
    rust_analyzer = true,
    nil_ls = true,
    zls = true,
    gopls = true,

    c3_lsp = {
        install = false,
    },
    ocamllsp = {
        install = false,
        cmd = { "ocamllsp" },
    },
}

local lspconfig = require("lspconfig")
require("mason").setup()
local ensure_installed = {}


for name, config in pairs(servers) do
    if config == true or config.enabled == true then
        config = {}
    end

    config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
    lspconfig[name].setup(config)

    if config.install == false then
        goto continue
    end

    table.insert(ensure_installed, name)
    ::continue::
end


require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
    automatic_installation = false,
})

require("lazydev").setup {
    enabled = true,
}

require("ocaml").setup {
    setup_conform = true,
    setup_lspconfig = true,
    install_mlx = false,
    install_rapper = false,
}
require("conform").setup {
    format_after_save = {
        lsp_format = "first"
    },
    notify_on_error = false,
}

require("fidget").setup {}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true)

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
