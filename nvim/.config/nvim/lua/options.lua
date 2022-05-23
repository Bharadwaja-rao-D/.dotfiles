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

