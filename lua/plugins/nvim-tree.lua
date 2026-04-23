return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			actions = {
				change_dir = {
					restrict_above_cwd = true,
				},
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Toggle file explorer" },
	},
}
