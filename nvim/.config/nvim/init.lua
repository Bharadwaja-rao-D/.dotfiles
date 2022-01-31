-- Neovim config

require "options"
require "keymapings"
require "plugins"
require "lsp"
require "telescope-config"
require "treesitter-config"
vim.cmd "source ~/.config/nvim/lua/vimspector.vim"
vim.cmd "source ~/.config/nvim/lua/statusline.vim"
vim.cmd "source ~/.config/nvim/lua/autocmd.vim"
