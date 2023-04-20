vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<n-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- fetch keymap
local map = vim.api.nvim_set_keymap

map('n', 'n', ':NvimTreeToggle<CR>', {noremap=true})
map('n', '<leader>ci', ':TypescriptAddMissingImports<CR>', {noremap=true})
