local function set_treesitter_context_transparent()
  vim.defer_fn(function()
    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TreesitterContextSeparator', { bg = 'NONE' })
  end, 50)
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = set_treesitter_context_transparent,
})

set_treesitter_context_transparent()
