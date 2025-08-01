local lspconfig = require "lspconfig"

local servers = {
  rust_analyzer = true,
  zls = true,
  gopls = true,
  ccls = true,
  nil_ls = true,
  lua_ls = true,
  tinymist = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
    local bufnr = args.bufnr
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)
      Snacks.toggle.inlay_hints():map("<leader>th")
    end

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf)
    end

    vim.diagnostic.config({ virtual_text = { current_line = true } })
    Snacks.toggle.diagnostics():map("<leader>td")

    vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { buffer = bufnr })
    vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { buffer = bufnr })
    vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { buffer = bufnr })
    vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { buffer = bufnr })

    vim.keymap.set("n", "<leader>wd", function() Snacks.picker.lsp_symbols() end, { buffer = bufnr })
    vim.keymap.set("n", "<leader>wD", function() Snacks.picker.lsp_workspace_symbols() end, { buffer = bufnr })

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr })
  end,
})

for name, config in pairs(servers) do
  if config == true then
    ---@diagnostic disable-next-line: cast-local-type
    config = {}
  end
  lspconfig[name].setup(config)
end

require("fidget").setup {
  notification = {
    window = {
      winblend = 0,
    },
  },
}
