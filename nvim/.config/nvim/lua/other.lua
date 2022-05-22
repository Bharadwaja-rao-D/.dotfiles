 require("telescope").setup{
   defaults = {
     -- Default configuration for telescope goes here:
     -- config_key = value,
 	file_ignore_patterns = {"build/", "target/", "node_modules"},
   }
 }

 local opts = { silent = true, noremap = true }

 local keymap = vim.api.nvim_set_keymap

 keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
 keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
 keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

require'nvim-treesitter.configs'.setup{
	ensure_installed = {"c", "cpp", "rust", "javascript", "comment" },
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}
