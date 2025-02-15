local s = vim.keymap.set

s("n", "<esc>", "<cmd>noh<cr>")

s("n", "<c-j>", "<c-w><c-j>")
s("n", "<c-k>", "<c-w><c-k>")
s("n", "<c-l>", "<c-w><c-l>")
s("n", "<c-h>", "<c-w><c-h>")

s("n", "<leader>o", "<cmd>copen<cr>")
s("n", "<leader>c", "<cmd>cclose<cr>")
s("n", "<C-shift-j>", "<cmd>cnext<cr>")
s("n", "<C-shift-k>", "<cmd>cprev<cr>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
s("v", "K", ":m '<-2<CR>gv=gv")
s("v", "J", ":m '>+1<CR>gv=gv")
