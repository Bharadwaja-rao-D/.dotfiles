local opts = { silent = true, noremap = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("n", "<C-j>", "<C-w>w", opts)
keymap("n", "<C-h>", ":bprev<cr>", opts)
keymap("n", "<C-l>", ":bnext<cr>", opts)
keymap("t", "<Esc", "<C-\\><C-n>", opts)

keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "D", "d$", opts)
keymap("n", "C", "c$", opts)

keymap("n", "<leader>pv", ":Ex <cr>", opts)

keymap("n", "<C-c>", "<Esc>", opts)

keymap("n", "gp", "<cmd> Git push <CR>", opts)
keymap("n", "<leader>u", "<cmd> UndotreeToggle<CR>", opts)

