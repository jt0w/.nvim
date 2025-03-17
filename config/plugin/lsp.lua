local lspconfig = require "lspconfig"

local servers = {
    rust_analyzer = true,
    zls = true,
    gopls = true,
    ccls = true,
    nil_ls = true
}

local on_attach = function(client, bufnr) 
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
        Snacks.toggle.inlay_hints():map("<leader>th")
    end

    vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { buffer = bufnr })
    vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { buffer = bufnr })
    vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = bufnr })
    vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { buffer = bufnr })

    vim.keymap.set("n", "<leader>wd", function() Snacks.picker.lsp_symbols() end, { buffer = bufnr })
    vim.keymap.set("n", "<leader>wD", function() Snacks.picker.lsp_workspace_symbols() end, { buffer = bufnr })

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
end


for name, config in pairs(servers) do
    if config == true then
        config = {}
    end
    config.on_attach = on_attach
    lspconfig[name].setup(config)
end


