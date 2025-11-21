-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
-- require('onedark').load()

function line_num()
  if vim.v.relnum == 0 then
    return "test"
  else
    return "%r"
  end
end

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
  .. "i-ci:ver25-Cursor/lCursor,"
  .. "ve:ver35-Cursor,"
  .. "r-cr:hor20-Cursor/lCursor,"
  .. "o:hor50-Cursor,"
  .. "sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,"
  .. "a:blinkwait200-blinkoff500-blinkon500-Cursor/lCursor"

vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shiftround = true

-- This breaks gitsigns, come back to this later
--vim.opt.statuscolumn = '%=%{v:relnum?v:relnum."    ":v:lnum."      "}'
vim.opt.signcolumn = "yes"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = { 80, 120 }

vim.opt.splitright = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.showcmd = true
vim.opt.showmode = true

vim.opt.backup = false

vim.g.lazyvim_check_order = false
