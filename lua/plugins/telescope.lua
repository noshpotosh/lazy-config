return {
    "nvim-telescope/telescope.nvim",
    config = function() 
        require('telescope').load_extension('harpoon')
    end
}
