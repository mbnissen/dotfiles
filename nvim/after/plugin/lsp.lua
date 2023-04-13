local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
	'elixirls',
  'tailwindcss',
	'tsserver',
	'eslint',
  'html',
	'lua_ls',
  'terraformls'
})

require("luasnip.loaders.from_snipmate").lazy_load()

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()


