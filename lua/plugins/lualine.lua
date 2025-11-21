-- Come back to this later
local custom_theme = function()
  local colors = {
    black = "#282C34",
    red = "#E06C75",
    green = "#98C379",
    yellow = "#E5C07B",
    blue = "#61AFEF",
    purple = "#C678DD",
    gray = "#56B6C2",
    lightgray = "#ABB2BF",
  }
  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.red, gui = "bold" },
      b = { fg = colors.gray, bg = colors.red },
      c = { fg = colors.gray, bg = colors.red },
    },
  }
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  }
}
