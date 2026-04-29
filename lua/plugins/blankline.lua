return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "│", -- or "▏", "┊", "┆", "⎸"
			},
			scope = {
				enabled = true, -- highlights the current scope
				show_start = true, -- underline on scope start line
				show_end = false,
			},
		})
	end,
}
