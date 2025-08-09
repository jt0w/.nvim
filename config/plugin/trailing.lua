vim.api.nvim_create_augroup('TrailingWhitespace', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
  group = 'TrailingWhitespace',
  pattern = '*',
  callback = function()
    vim.fn.clearmatches()
  end
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWinEnter' }, {
  group = 'TrailingWhitespace',
  pattern = '*',
  callback = function()
    vim.fn.clearmatches()
    vim.fn.matchadd('ErrorMsg', [[\s\+$]])
  end
})
