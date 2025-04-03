return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { 'javascript', 'typescript' },
  root_markers = { 'eslint.config.mjs' },
  on_attach = function(client, bufnr)
    print('eslint server attached to buffer')
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   buffer = bufnr,
    --   command = "EslintFixAll",
    -- })
  end,
}
