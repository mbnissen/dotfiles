local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { 'javascript' },
    ['rust_analyzer'] = { 'rust' },
    ['next-ls'] = { 'elixir' },
    ['marksman'] = { 'markdown' },
    ['lua_ls'] = { 'lua' },
    ['anakinls'] = { 'python' }
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'eslint', 'html', 'lua_ls', 'terraformls', 'tailwindcss', 'marksman' },
  handlers = {
    lsp_zero.default_setup,
  }
})

local lspconfig = require('lspconfig')

lspconfig.tailwindcss.setup {}

lspconfig.eslint.setup({
  settings = {
    packageManager = 'yarn'
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

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
