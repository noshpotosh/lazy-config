return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.search").setup({
        override_lens = function() end,
    })
  end,
  opts = {},
}
