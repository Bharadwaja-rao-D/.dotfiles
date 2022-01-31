-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
	vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
	i = cmp.mapping.abort(),
	c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').clangd.setup {
	capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
	capabilities = capabilities
}

require('lspconfig').tsserver.setup {
	capabilities = capabilities
}

require('lspconfig').cmake.setup {
	capabilities = capabilities
}
-- some lsp keymapings

vim.cmd "nnoremap <localleader>vd :lua vim.lsp.buf.definition()<cr>"
vim.cmd "nnoremap <localleader>h :lua vim.lsp.buf.hover()<cr>"
vim.cmd "nnoremap <localleader>s :lua vim.lsp.buf.signature_help()<cr>"
vim.cmd "nnoremap <localleader>r :lua vim.lsp.buf.rename()<cr>"
vim.cmd "nnoremap <localleader>ca :lua vim.lsp.buf.code_action()<cr>"
vim.cmd "nnoremap <localleader>f :lua vim.lsp.buf.formatting()<cr>"


