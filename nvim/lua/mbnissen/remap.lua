vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<n-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- fetch keymap
local map = vim.api.nvim_set_keymap

map('n', '<C-n>', ':NvimTreeToggle<CR>', {})
map('n', '<leader>ci', ':TSToolsAddMissingImports<CR>', { noremap = true })
map('n', '<leader>ca', ':TSToolsFixAll<CR>', { noremap = true })
map('n', '<leader>gg', ':LazyGit<CR>', { noremap = true })
