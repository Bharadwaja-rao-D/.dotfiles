local options = {
	clipboard = "unnamedplus",
	encoding = "UTF-8",
	completeopt = {"menuone", "noselect"},
	smartcase = true,
	smartindent = true,
	swapfile = false,
	termguicolors = true,
	shiftwidth = 4,
	tabstop = 4,
	number = true,
	relativenumber = true,
	wrap = false,
	scrolloff = 8,
	colorcolumn = "80",
	updatetime = 200,
	hlsearch=false,

}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.cmd "set guicursor = "
vim.cmd "set mouse=a"
vim.cmd "colorscheme gruvbox"
--vim.cmd "let g:gruvbox_contrast_dark = 'hard'"
vim.cmd "let g:netrw_browse_split = 0"
vim.cmd "let g:netrw_banner = 0"
vim.cmd "let g:netrw_winsize = 20"
vim.cmd"hi SignColumn guibg=none"

