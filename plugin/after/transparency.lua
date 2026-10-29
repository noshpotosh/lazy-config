local function transparent(group)
  local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
  highlight.bg = nil
  vim.api.nvim_set_hl(0, group, highlight)
end

local function apply_transparency()
  -- Cursor's One Dark Pro Flat background is opaque; preserve its exact color.
  if vim.g.colors_name == "onedark" then
    return
  end
  -- transparent background
  transparent("Normal")
  transparent("NormalFloat")
  transparent("FloatBorder")
  transparent("Pmenu")
  transparent("Terminal")
  transparent("EndOfBuffer")
  transparent("FoldColumn")
  transparent("Folded")
  transparent("SignColumn")
  transparent("NormalNC")
  transparent("WhichKeyFloat")
  transparent("TelescopeBorder")
  transparent("TelescopeNormal")
  transparent("TelescopePromptBorder")
  transparent("TelescopePromptTitle")

  -- transparent background for neotree
  transparent("NeoTreeNormal")
  transparent("NeoTreeNormalNC")
  transparent("NeoTreeVertSplit")
  transparent("NeoTreeWinSeparator")
  transparent("NeoTreeEndOfBuffer")

  -- transparent background for nvim-tree
  transparent("NvimTreeNormal")
  transparent("NvimTreeVertSplit")
  transparent("NvimTreeEndOfBuffer")

  -- transparent notify background
  transparent("NotifyINFOBody")
  transparent("NotifyERRORBody")
  transparent("NotifyWARNBody")
  transparent("NotifyTRACEBody")
  transparent("NotifyDEBUGBody")
  transparent("NotifyINFOTitle")
  transparent("NotifyERRORTitle")
  transparent("NotifyWARNTitle")
  transparent("NotifyTRACETitle")
  transparent("NotifyDEBUGTitle")
  transparent("NotifyINFOBorder")
  transparent("NotifyERRORBorder")
  transparent("NotifyWARNBorder")
  transparent("NotifyTRACEBorder")
  transparent("NotifyDEBUGBorder")
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("custom_transparency", { clear = true }),
  callback = apply_transparency,
})
apply_transparency()
