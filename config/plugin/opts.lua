g.mapleader = " "
g.maplocalleader = " "

g.langmap = "äö"
g.c_syntax_for_h = true
o.guicursor = ""
o.cursorline = true
o.nu = true
o.rnu = true
o.scrolloff = 15
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.undofile = true
o.splitright = true
o.splitbelow = true
o.hlsearch = true
o.incsearch = true
o.termguicolors = true
o.laststatus = 3
o.cmdheight = 1
o.wildmode = "longest,noselect"
o.clipboard = "unnamedplus"
o.syntax = "on"
o.winborder = "rounded"
o.completeopt = { "menu", "menuone", "noselect" }
o.virtualedit = "block"
o.inccommand = "split"
o.signcolumn = "yes"

o.fillchars = {
  eob = ' ',
}

o.lcs = {
  eol = "↲",
  space = "·",
  tab = "» ",
}
o.list = true

vim.api.nvim_create_augroup('TrailingWhitespace', { clear = true })

-- Clear highlighting when entering insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  group = 'TrailingWhitespace',
  pattern = '*',
  callback = function()
    vim.fn.clearmatches()
  end
})

-- Add highlighting when leaving insert mode or entering a buffer
vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWinEnter' }, {
  group = 'TrailingWhitespace',
  pattern = '*',
  callback = function()
    vim.fn.clearmatches()
    vim.fn.matchadd('ErrorMsg', [[\s\+$]])
  end
})
