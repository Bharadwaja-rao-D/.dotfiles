return require('packer').startup(function()
-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	use 'gruvbox-community/gruvbox'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'

	use 'Townk/vim-autoclose'
	use 'tpope/vim-commentary'

	-- cmp realted

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- lsp

	use 'neovim/nvim-lspconfig'

	use 'nvim-telescope/telescope.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- for debugging
	use 'puremourning/vimspector'

	use 'sbdchd/neoformat'

	use 'tpope/vim-fugitive'

	use 'mattn/emmet-vim'

	use 'lewis6991/gitsigns.nvim'

  end)
