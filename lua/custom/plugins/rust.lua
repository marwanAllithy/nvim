return {

	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- recommended
		lazy = false, -- this plugin is already lazy
		ft = "rust",
		["rust-analyzer"] = {
			cargo = {
				allfeatures = true,
				checkonsave = { command = "clippy" },
				completion = { autoimport = { enable = true }, postfix = { enable = true } },
				imports = { granularity = { group = "module" }, prefix = "self" },
				inlayhints = {
					lifetimeelisionhints = { enable = true, useparameternames = true },
					parameterhints = { enable = true },
					typehints = { enable = true },
				},
			},
		},
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
