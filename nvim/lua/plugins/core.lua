return {
  -- disable prettier for JS/TS files so eslint handles formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = {},
        javascriptreact = {},
        typescript = {},
        typescriptreact = {},
      },
    },
  },
  -- auto-fix eslint issues on save
  {
    "neovim/nvim-lspconfig",
    init = function()
      local base_on_attach = vim.lsp.config.eslint and vim.lsp.config.eslint.on_attach
      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          if base_on_attach then
            base_on_attach(client, bufnr)
          end

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ name = "eslint", async = false })
            end,
          })
        end,
      })
    end,
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
