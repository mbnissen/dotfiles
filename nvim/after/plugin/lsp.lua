local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- Use autoformat on all files
  -- for explicit setup use this
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/lsp.md#explicit-setup
  -- lsp_zero.buffer_autoformat()

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
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'eslint', 'elixirls', 'html', 'lua_ls', 'terraformls', 'tailwindcss' },
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
local cmp_action = require('lsp-zero').cmp_action()

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

    -- `Enter` key to confirm completion
    -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- Ctrl+Space to trigger completion menu
    --['<C-Space>'] = cmp.mapping.complete(),
    ---- Navigate between snippet placeholder
    --['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ---- Scroll up and down in the completion documentation
    --['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

-- lsp.setup()

-- local lsp = require('lsp-zero').preset({
--   name = 'minimal',
--   set_lsp_keymaps = true,
--   manage_nvim_cmp = true,
--   suggest_lsp_servers = false,
-- })
--
-- lsp.ensure_installed({
-- 	'elixirls',
--   'tailwindcss',
-- 	'tsserver',
-- 	'eslint',
--   'html',
-- 	'lua_ls',
--   'terraformls'
-- })
--
-- -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--
--   --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--   --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
--   --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
--   --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)
--
-- require("luasnip.loaders.from_snipmate").lazy_load()
--
-- local cmp = require('cmp')
--
-- cmp.setup({
--   sources = {
--     {name = 'luasnip' },
--     {name = 'copilot'},
--     {name = 'nvim_lsp'},
--   },
-- --  --mapping = {
-- --  --  -- `Enter` key to confirm completion
-- --  --  ['<CR>'] = cmp.mapping.confirm({
-- --  --    -- documentation says this is important.
-- --  --    -- I don't know why.
-- --  --    behavior = cmp.ConfirmBehavior.Replace,
-- --  --    select = false,
-- --  --  })
-- --
-- --  --  -- Ctrl+Space to trigger completion menu
-- --  --  -- ['<C-Space>'] = cmp.mapping.complete(),
-- --
-- --  --  -- Navigate between snippet placeholder
-- --  --  --['<C-f>'] = cmp.action.luasnip_jump_forward(),
-- --  --  --['<C-b>'] = cmp.action.luasnip_jump_backward(),
-- --  --}
-- })
--
-- lsp.setup()
