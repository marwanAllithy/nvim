return 	{
		"andweeb/presence.nvim",
		zy = false,
		config = function()
			require("presence").setup({
				auto_update = true,
				neovim_image_text = "i use nvim btw",
				main_image = "file",
				client_id = "793271441293967371", -- default discord client id for presence.nvim
				log_level = nil,
				debounce_timeout = 5,
				enable_line_number = false,
				blacklist = {},
				buttons = true,
				file_assets = {},
				show_time = true,
			})
		end,
	}

