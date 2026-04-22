return 
	{"kylechui/nvim-surround",
    version = "*",
    -- event = "veryLazy",
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        -- all default keymaps are fine
      }
    end,
  }
