-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Normal mode
--
vim.keymap.set("n", "<leader>fs", ":w<CR>", { silent = true, desc = "Save File" })
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true, nowait = true, desc = "Save File" })
vim.keymap.set("n", "<leader>i", function()
  if vim.fn.winnr("$") > 1 then
    vim.cmd.close()
  else
    require("mini.bufremove").delete()
  end
  vim.cmd("wincmd =")
end, { desc = "Close Editor Group" })
vim.keymap.set("n", "<leader>k", function()
  require("mini.bufremove").delete()
  vim.cmd("wincmd =")
end, { desc = "Close Editor" })

vim.keymap.set("n", "<leader>t", ":FloatermToggle<CR>", { silent = true, nowait = true, desc = "Toggle Floaterm" })
vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>", { silent = true, desc = "Toggle Floaterm" })

vim.keymap.set("n", "<leader>v", "<cmd>vsplit<bar>wincmd =<cr>", { desc = "Split Editor Right" })
vim.keymap.set("n", "<leader>h", "<cmd>split<bar>wincmd =<cr>", { desc = "Split Editor Down" })

-- Cursor's Ctrl-h/l cycle through editor groups, skipping sidebars and floats.
local function cycle_editor(direction)
  local windows = vim.tbl_filter(function(win)
    return vim.api.nvim_win_get_config(win).relative == "" and vim.bo[vim.api.nvim_win_get_buf(win)].buftype == ""
  end, vim.api.nvim_tabpage_list_wins(0))
  if #windows == 0 then
    return
  end
  local current = vim.api.nvim_get_current_win()
  for i, win in ipairs(windows) do
    if win == current then
      vim.api.nvim_set_current_win(windows[(i - 1 + direction) % #windows + 1])
      return
    end
  end
  vim.api.nvim_set_current_win(windows[1])
end
vim.keymap.set("n", "<C-l>", function()
  cycle_editor(1)
end, { desc = "Next Editor Group" })
vim.keymap.set("n", "<C-h>", function()
  cycle_editor(-1)
end, { desc = "Previous Editor Group" })
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:FloatermNew<CR>", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n>:FloatermNext<CR>", { silent = true })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n>:FloatermPrev<CR>", { silent = true })

-- Diff View
vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { silent = true })

-- Harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  local list = harpoon:list()
  local item = list.config.create_list_item(list.config)
  if list:get_by_value(item.value) then
    list:remove(item)
  else
    list:add(item)
  end
end, { desc = "Toggle Harpoon Bookmark" })

vim.keymap.set("n", "<leader>j", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { nowait = true, desc = "Harpoon Bookmarks" })

vim.keymap.set("n", "<S-Tab>", function()
  harpoon:list():prev()
end, { desc = "Previous Harpoon Bookmark" })

vim.keymap.set("n", "<Tab>", function()
  harpoon:list():next()
end, { desc = "Next Harpoon Bookmark" })

-- File finding
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    action = "focus",
    source = "filesystem",
    position = "right",
    dir = LazyVim.root(),
  })
end, { desc = "Focus Explorer" })
vim.keymap.set("n", "<leader>c", function()
  require("neo-tree.command").execute({ action = "focus", source = "git_status", position = "right" })
end, { nowait = true, desc = "Focus Source Control" })
-- Keep common IDE actions available when Cursor's single-key shortcuts take
-- priority over LazyVim's search/code prefixes.
vim.keymap.set("n", "<leader>F", function()
  LazyVim.format({ force = true })
end, { desc = "Format File" })
vim.keymap.set({ "n", "x" }, "<leader>C", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>fl", function()
  require("lint").try_lint()
end, { desc = "Run Linter" })
vim.keymap.set("n", "<leader>fr", function()
  local lint = require("lint")
  for _, name in ipairs(lint.linters_by_ft[vim.bo.filetype] or {}) do
    vim.diagnostic.reset(lint.get_namespace(name), 0)
  end
end, { desc = "Clear Linter Diagnostics" })
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { silent = true, desc = "Browse Files (cwd)" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>fE",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, silent = true, desc = "Browse Files (Buffer Directory)" }
)

-- Find things
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gc", builtin.git_status, {})
vim.keymap.set("n", "<leader>gs", builtin.git_stash, {})
