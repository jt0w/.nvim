local g = vim.g
local o = vim.opt

g.mapleader = " "
g.maplocalleader = " "

g.netrw_browser_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_cursor = false
g.langmap = "äö"
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")

g.c_syntax_for_h = true

o.tabstop = 4
o.softtabstop = -1
o.expandtab = true

o.undofile = true

o.splitright = true
o.splitbelow = true

o.hlsearch = true
o.incsearch = true
o.termguicolors = true

o.laststatus = 0

o.clipboard = "unnamedplus"
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

vim.cmd("syntax on | color retrobox")

vim.keymap.set("n", "<space>c", function()
  vim.ui.input ({}, function(c) 
      if c and c~="" then 
        vim.cmd("noswapfile vnew") 
        vim.bo.buftype = "nofile"
        vim.bo.bufhidden = "wipe"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
      end 
  end) 
end)



