-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = ' '
vim.g.mapleaderlocal = ' '

-- Normal mode 
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

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
