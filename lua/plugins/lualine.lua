local pink = { fg = "#EEF0F2", bg = "#EF7A85" }
local theme = {}
for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "terminal", "inactive" }) do
  theme[mode] = { a = vim.deepcopy(pink), b = vim.deepcopy(pink), c = vim.deepcopy(pink) }
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = theme,
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
