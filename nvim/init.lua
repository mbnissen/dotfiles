require("mbnissen")

vim.lsp.config('*', {
  on_init = function()
    print('Language server initialized')
  end,
  on_attach = function(client, bufnr)
    print('Language server attached to buffer')

    -- Enable formatting on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end

    -- Set up key mappings
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References" })
  end,
})

--vim.lsp.config('eslint', {
--  on_attach = function(client, bufnr)
--    vim.api.nvim_create_autocmd("BufWritePre", {
--      buffer = bufnr,
--      command = "EslintFixAll",
--    })
--  end,
--})
--

vim.lsp.enable('luals')
vim.lsp.enable('tsserver')
vim.lsp.enable('eslint')
vim.lsp.enable('elixirls')
