require("elixir").setup({
  nextls = {
    enable = true,                                                 -- defaults to false
    -- port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    cmd = "/Users/mbnissen/.cache/elixir-tools/nextls/bin/nextls", -- path to the executable. mutually exclusive with `port`
    init_options = {
      mix_env = "dev",
      mix_target = "host",
      experimental = {
        completions = {
          enable = true -- control if completions are enabled. defaults to false
        }
      }
    },
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  credo = { enable = false },
  elixirls = { enable = false },
})
