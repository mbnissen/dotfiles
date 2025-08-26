require("mbnissen")

vim.lsp.config('*', {
  on_init = function()
  end,
  on_attach = function(client, bufnr)
    -- Set up key mappings
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References" })
  end,
})

local lspconfig = require("lspconfig")
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

vim.lsp.enable('luals')
vim.lsp.enable('tsserver')
vim.lsp.enable('elixirls')
vim.lsp.enable('terraform_lsp')
