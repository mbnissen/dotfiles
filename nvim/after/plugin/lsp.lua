local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['rust_analyzer'] = { 'rust' },
    ['lua_ls'] = { 'lua' },
    ['terraformls'] = { 'terraform' },
    ['anakinls'] = { 'python' }
  }
})

-- lsp_zero.extend_lspconfig({
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   lsp_attach = lsp_attach,
--   float_border = 'rounded',
--   sign_text = true,
-- })

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'eslint', 'html', 'lua_ls', 'terraformls', 'marksman' },
  handlers = {
    lsp_zero.default_setup,
  }
})

local lspconfig = require('lspconfig')

lspconfig.marksman.setup {}

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
