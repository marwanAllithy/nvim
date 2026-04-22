return {
-- 1. The base16 colorscheme plugin (required)
{
  "RRethy/base16-nvim",
},

-- 2. Lualine (optional but covered in the guide)
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "RRethy/base16-nvim"  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "base16", -- uses the base16 colors automatically
      },
    })
  end,
}}
