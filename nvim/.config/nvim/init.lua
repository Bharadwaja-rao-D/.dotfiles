-- Neovim config

require "options"
require "keymapings"
require "plugins"
require "lsp"
require "telescope-config"
require "treesitter-config"
require "statusline"
vim.cmd "source ~/.config/nvim/lua/vimspector.vim"
vim.cmd "source ~/.config/nvim/lua/autocmd.vim"
--require('gitsigns').setup()
