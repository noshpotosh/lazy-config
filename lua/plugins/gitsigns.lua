return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").current_line_blame = true -- Toggle with `:Gitsigns toggle_current_line_blame`
    end,
    opts = {},
}
