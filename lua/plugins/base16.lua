return {
  {
    "RRethy/base16-nvim",
    -- priority = 1000,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "base16",
        },
      })
    end,
  },
}
