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

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'luasnip' },
    {name = 'copilot'},
    {name = 'nvim_lsp'},
  },
  mapping = {
    -- `Enter` key to confirm completion
    -- ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    -- ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    --['<C-f>'] = cmp.action.luasnip_jump_forward(),
    --['<C-b>'] = cmp.action.luasnip_jump_backward(),
  }
})


