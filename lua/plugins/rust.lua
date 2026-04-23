return {

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		ft = "rust",
		config = function()
			vim.api.nvim_create_autocmd("CursorHold", {
				pattern = "*.rs",
				callback = function()
					vim.cmd.RustLsp({ "hover", "actions" })
				end,
			})
		end,
		["rust-analyzer"] = {
			cargo = {
				allfeatures = true,
				checkonsave = { command = "clippy" },
				completion = { autoimport = { enable = true }, postfix = { enable = true } },
				imports = { granularity = { group = "module" }, prefix = "self" },
				loadOutDirsFromPkgJson = true,
			},
			inlayhints = {
				lifetimeelisionhints = { enable = true, useparameternames = true },
				parameterhints = { enable = true },
				typehints = { enable = true },
			},
			typingAutoWrap = "force",
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
			require("crates").setup({})
		end,
	},
}