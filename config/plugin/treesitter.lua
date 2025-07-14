vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ok, parser = pcall(vim.treesitter.get_parser, 0)
    if ok and parser then
      vim.treesitter.start()
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})
