require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'luasnip' },
    { name = 'copilot' },
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  })
})
