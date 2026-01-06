require("mbnissen")

vim.lsp.config('*', {
  on_init = function()
  end,
  on_attach = function(client, bufnr)
    -- Set up key mappings
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References" })

    --vim.lsp.completion.enable(true, client.id, bufnr, {
    --  autotrigger = true,
    --})
  end,
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not base_on_attach then return end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})

vim.lsp.enable('eslint')
vim.lsp.enable('elixirls')
vim.lsp.enable('luals')
vim.lsp.enable('vtsls')
vim.lsp.enable('terraform_lsp')

vim.lsp.config('elixirls', {
  cmd = { "/Users/mbnissen/elixir-ls/language_server.sh" },
  on_attach = function(client, bufnr)
    -- Set up key mappings
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References" })

    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end
  end
})
