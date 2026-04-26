return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = "bd %d",
				indicator = {
					style = "icon",
					icon = "▎",
				},
				modified_icon = "●",
				left_trunc_marker = "󰜷",
				right_trunc_marker = "󰜵",
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				always_show_bufferline = true,
				diagnostics_update_in_insert = false,
			},
		})
	end,
}
