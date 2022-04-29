-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
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

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['tsserver'].setup {
	  on_attach = custom_attach, root_dir = vim.loop.cmd
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
--vim.cmd"nnoremap <C-h> :lua vim.lsp.buf.signature_help()<CR>"
vim.cmd"let g:rustfmt_autosave = 1"
