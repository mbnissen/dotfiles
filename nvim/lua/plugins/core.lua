return {
  -- use mix format for elixir (reads .formatter.exs)
  -- no conform formatters for JS/TS — eslint LSP handles it via lsp_format fallback
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        heex = { "mix" },
        eex = { "mix" },
        javascript = {},
        javascriptreact = {},
        typescript = {},
        typescriptreact = {},
      },
    },
  },
  -- disable formatting on the TS LSP so eslint LSP is used as the fallback formatter
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
  },
  -- load snipMate-format snippets from snippets/
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- customize snacks explorer: <C-n> to toggle, <C-p> opens file finder
  {
    "folke/snacks.nvim",
    keys = {
      { "<C-n>", function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "Explorer Snacks (root dir)" },
      { "<leader>e", false },
      { "<leader>E", false },
    },
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<c-p>"] = { "picker_files", desc = "Find Files", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
  },
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
