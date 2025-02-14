local s = vim.keymap.set

s("n", "<leader>e", "<cmd>Explore<cr>")
s("n", "<esc>", "<cmd>noh<cr>")

s("n", "<leader>o", "<cmd>copen<cr>")
s("n", "<leader>c", "<cmd>cclose<cr>")
s("n", "<C-j>", "<cmd>cnext<cr>")
s("n", "<C-k>", "<cmd>cprev<cr>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
s("v", "K", ":m '<-2<CR>gv=gv")
s("v", "J", ":m '>+1<CR>gv=gv")
