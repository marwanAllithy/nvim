return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "personal",
				path = "/home/marwan/mnt/D/Nextcloud/notes",
			},
		},
	},
}
