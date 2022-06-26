--basic keymaps
local Remap = require("bharadwaja.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<nop>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--telescope
local Remap = require("bharadwaja.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>gs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>fw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
nnoremap("<leader>va", function()
    require('bharadwaja.telescope').anime_selector()
end)
nnoremap("<leader>gc", function()
    require('bharadwaja.telescope').git_branches()
end)
-- harpoon stuff
local nnoremap = require("bharadwaja.keymap").nnoremap

local silent = { silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-t>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-n>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-s>", function() require("harpoon.ui").nav_file(4) end, silent)
