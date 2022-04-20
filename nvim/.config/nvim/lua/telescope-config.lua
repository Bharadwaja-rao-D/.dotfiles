local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup{
  defaults = {
	  file_sorter = require("telescope.sorters").get_fzy_sorter,
	  prompt_prefix = " >",
	  color_devicons = true,
	  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

	  -- Default configuration for telescope goes here:
	  -- config_key = value,
	  file_ignore_patterns = {"build/", "target/", "node_modules"},

	  mappings = {
		  i = {
			  ["<C-x>"] = false,
			  ["<C-q>"] = actions.send_to_qflist,
		  },
	  },
  },
  extensions = {
	  fzy_native = {
		  override_generic_sorter = false,
		  override_file_sorter = true,
	  },
  },
}

local M = {}

local function set_background(content)
	vim.fn.system("dconf write /org/mate/desktop/background/picture-filename \"'" .. content .."'\"")
end

local function select_background(prompt_bufnr, map)
	local function set_the_background(close)
		local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
		set_background(content.cwd .. "/" .. content.value)
		if close then
			require("telescope.actions").close(prompt_bufnr)
		end
	end

	map("i", "<C-p>", function()
		set_the_background()
	end)

	map("i", "<CR>", function()
		set_the_background(true)
	end)
end

local function image_selector(prompt, cwd)
	return function()
		require("telescope.builtin").find_files({
			prompt_title = prompt,
			cwd = cwd,
			
			attach_mappings = function(prompt_bufnr, map)
				select_background(prompt_bufnr, map)
				return true
			end,
		})
	end
end

M.wallpaper_selector = image_selector("< Wallpaper > ", "~/Pictures/wallpapers")

return M

