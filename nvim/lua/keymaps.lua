local opts = { silent = true, noremap = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

keymap("n", "<C-j>", "<C-w>w", opts)
keymap("n", "<C-h>", ":bprev<cr>", opts)
keymap("n", "<C-l>", ":bnext<cr>", opts)
keymap("n", "<C-r>", "%s//gI<left><left><left>", opts)
keymap("t", "<Esc", "<C-\\><C-n>", opts)

keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "D", "d$", opts)
keymap("n", "C", "c$", opts)

keymap("n", "<leader>pv", ":Lexplore 25<cr>", opts)

keymap("n", "<C-c>", "<Esc>", opts)

keymap("i", "<localleader>e", "<C-y>,", {noremap = false, silent = true})
