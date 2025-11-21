-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Normal mode 
--
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>i', ':q<CR>')
vim.keymap.set('n', '<leader>k', function()
  require("mini.bufremove").delete()
end)

vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>')

vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>h', ':split<CR>')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- Terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermNew<CR>')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:FloatermNext<CR>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:FloatermPrev<CR>')

-- Diff View
vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>j", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<S-Tab>", function()
  harpoon:list():prev()
end)

vim.keymap.set("n", "<Tab>", function()
  harpoon:list():next()
end)

-- File finding
vim.api.nvim_set_keymap(
  "n",
  "<leader>eg",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>el",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

-- Find things
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_status, {})
vim.keymap.set('n', '<leader>gs', builtin.git_stash, {})
