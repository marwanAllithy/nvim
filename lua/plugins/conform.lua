return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	---@module 'conform'
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			local enabled_filetypes = {
				rust = true,
				html = true,
				typescript = true,
				toml = true,
				lua = true,
				python = true,
			}
			if enabled_filetypes[vim.bo[bufnr].filetype] then
				return { timeout_ms = 500 }
			else
				return nil
			end
		end,
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			rust = { "rustfmt" },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
