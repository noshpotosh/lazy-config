-- Use Omarchy's current theme on Linux, with a portable default elsewhere.
local omarchy_theme = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
if vim.fn.has("linux") == 1 and vim.fn.filereadable(omarchy_theme) == 1 then
  return dofile(omarchy_theme)
end

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      colors = { bg = "#282c34", fg = "#abb2bf" },
      highlights = {
        LineNr = { fg = "#495162" },
        ColorColumn = { bg = "#44343e" },
        WinSeparator = { fg = "#282c34", bg = "#282c34" },
        NeoTreeNormal = { fg = "#abb2bf", bg = "#282c34" },
        NeoTreeNormalNC = { fg = "#abb2bf", bg = "#282c34" },
      },
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "onedark" } },
}
