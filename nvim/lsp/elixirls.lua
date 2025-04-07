return {
  cmd = { "nextls", "--stdio" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_markers = { '.formatter.exs', 'mix.exs' },
  on_attach = function(client, bufnr)
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
