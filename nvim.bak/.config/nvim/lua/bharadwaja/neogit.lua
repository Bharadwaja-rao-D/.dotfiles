local neogit = require('neogit')
local nnoremap = require('bharadwaja.keymap').nnoremap

neogit.setup {}

nnoremap("<leader>go", function()
    neogit.open({ })
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
