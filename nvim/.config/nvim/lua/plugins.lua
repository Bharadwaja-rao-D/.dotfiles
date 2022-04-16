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
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind-nvim'
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

	-- lsp

	use 'neovim/nvim-lspconfig'

	use 'nvim-telescope/telescope.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- for debugging
	use 'puremourning/vimspector'

	use 'mattn/emmet-vim'

	use 'tpope/vim-fugitive'

	use 'sbdchd/neoformat'

  end)
