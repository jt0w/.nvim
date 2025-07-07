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
o.expandtab = false

o.undofile = true

o.splitright = true
o.splitbelow = true

o.hlsearch = true
o.incsearch = true
o.termguicolors = true

o.laststatus = 0

o.wildmode = "longest,noselect"

o.clipboard = "unnamedplus"
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.cmd("syntax on | color retrobox")

function create_floating_window(f)
		local buf = vim.api.nvim_create_buf(false, true)

		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.8)
		local col = math.floor((vim.o.columns - width) / 2)
		local row = math.floor((vim.o.lines - height) / 2)

		local opts = {
				style = "minimal",
				relative = "editor",
				width = width,
				height = height,
				row = row,
				col = col,
				border = "rounded",  -- other options: "single", "double", "solid", "none"
		}

		vim.api.nvim_open_win(buf, true, opts)
		if (f) then
				f()
		end

		vim.keymap.set("n", "q", "<cmd>quit<cr>", {buffer =  buf})
		vim.keymap.set("n", "<esc>", "<cmd>quit<cr>", {buffer =  buf})
end

vim.keymap.set("n", "<leader>c", function()
  vim.ui.input ({}, function(c) 
      if c and c~="" then 
        create_floating_window(function()
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
		end)
      end 
  end) 
end)

vim.keymap.set("n", "<leader>s", function() create_floating_window() end) 
vim.keymap.set("n", "<leader>t", function() 
		create_floating_window(function()
				vim.cmd("term")
		end) 
end) 
vim.keymap.set("n", "<leader>f", function(opts)
  vim.ui.input ({}, function(c) 
      if c and c~="" then
        vim.bo[].ft = c
      end 
  end) 
end)

require ("catppuccin").setup {
    transparent_background = true,
    show_end_of_buffer = true,
}

vim.cmd.colorscheme "catppuccin"
