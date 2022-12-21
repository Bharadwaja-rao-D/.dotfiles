-- Setup nvim-cmp.
local cmp = require'cmp'

local source_mapping = {
	nvim_lsp = "[LSP]",
	buffer = "[Buffer]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	formatting = {
		format = function(entry, vim_item)
			-- vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			-- if entry.source.name == "cmp_tabnine" then
			-- 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 		menu = entry.completion_item.data.detail .. " " .. menu
			-- 	end
			-- 	vim_item.kind = ""
			-- end
			vim_item.menu = menu
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		--{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local function attach()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
			vim.keymap.set("n", "<leader>vd", vim.lsp.diagnostic.open_float, {buffer=0})
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {buffer=0})
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {buffer=0})
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {buffer=0})
		end



-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	}
require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities
}
require'lspconfig'.emmet_ls.setup{}
require('lspconfig')['tsserver'].setup {
	capabilities = capabilities,
	cmd = {'typescript-language-server', '--stdio'},
	on_attach = custom_attach, root_dir = vim.loop.cwd

}

vim.cmd"nnoremap gd :lua vim.lsp.buf.definition()<CR>"
vim.cmd"nnoremap K :lua vim.lsp.buf.hover()<CR>"
vim.cmd"nnoremap <leader>vws :lua vim.lsp.buf.workspace_symbol()<CR>"
vim.cmd"nnoremap <leader>vd :lua vim.diagnostic.open_float()<CR>"
vim.cmd"nnoremap [d :lua vim.lsp.diagnostic.goto_next()<CR>"
vim.cmd"nnoremap ]d :lua vim.lsp.diagnostic.goto_prev()<CR>"
vim.cmd"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>"
vim.cmd"nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>"
vim.cmd"nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>"
vim.cmd"inoremap <C-h> <cmd>lua vim.lsp.buf.signature_help()<CR>"

vim.cmd "let g:rustfmt_autosave = 1"
