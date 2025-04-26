return {
  cmd = { "nextls", "--stdio" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_markers = { '.formatter.exs', 'mix.exs' },
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
}
