return require('packer').startup(function()
-- Packer can manage itself
  	use 'wbthomason/packer.nvim'
	use 'gruvbox-community/gruvbox'

	--basic utilites
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'Townk/vim-autoclose'
	use 'tpope/vim-commentary'

	--lsp related
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'onsails/lspkind-nvim'

	use 'nvim-telescope/telescope.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'tpope/vim-fugitive'
	use 'rust-lang/rust.vim'


  end)
