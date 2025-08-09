vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.c_syntax_for_h = true
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.scrolloff = 15
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"

vim.opt.fillchars = {
  eob = ' ',
}

vim.opt.lcs = {
  eol = "↲",
  space = "·",
  tab = "» ",
}
vim.opt.list = true

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>,", "<C-^>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>o", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>cclose<cr>")
vim.keymap.set("n", "<leader>j", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<cr>")

vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")

require("mini.align").setup()
require("mini.splitjoin").setup()

require("mini.pick").setup()
local builtin = require("mini.pick").builtin
vim.keymap.set('n', '<leader>f', builtin.files, { desc = 'find files' })
vim.keymap.set('n', '<leader>s', builtin.grep_live, { desc = 'grep_live' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'find buffers' })
vim.keymap.set('n', '<leader>h', builtin.help, { desc = 'search help tags' })

vim.lsp.enable({ "rust_analyzer", "zls", "gopls", "ccls", "nil_ls", "lua_ls", "tinymist", "pylsp" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
})

require("oil").setup({
  columns = {
    "permissions",
    "size",
    "mtime",
    "icon",
  },
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<leader>e", require("oil").open)

require("luasnip").setup({
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI"
})
require("luasnip.loaders.from_lua").load({ paths = { vim.g.snippets } })
local ls = require "luasnip"

vim.keymap.set({ "i", "s" }, "<c-k>", function() return ls.expand_or_jump() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function() return ls.jump(-1) end, { silent = true })

require("catppuccin").setup { transparent_background = true }
vim.cmd.colorscheme("catppuccin")
