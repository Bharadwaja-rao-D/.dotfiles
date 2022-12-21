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
 keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
 keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
 keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)

require'nvim-treesitter.configs'.setup{
	ensure_installed = {"c", "cpp", "rust", "javascript", "comment" },
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

 keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
 keymap("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
