vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- neovide config
if vim.g.neovide then
	vim.o.guifont = "Maple Mono NF:h9"

	vim.g.neovide_scale_factor = 1
	vim.g.neovide_cursor_animation_length = 0.12
	vim.g.neovide_scroll_animation_length = 0.12
	vim.g.neovide_floating_blur = 0.0
	vim.g.neovide_refresh_rate = 144

	local change_scale = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale(1.1)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale(1 / 1.1)
	end)
	vim.keymap.set("n", "<C-0>", function()
		vim.g.neovide_scale_factor = 1.0
	end)

	vim.keymap.set({ "n", "v" }, "<C-c>", '"+y')
	vim.keymap.set({ "n", "v" }, "<C-v>", '"+p')
	vim.keymap.set("i", "<C-v>", "<C-r>+")
end

-- obsidian
vim.o.conceallevel = 0

vim.opt.termguicolors = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.o.number = true
vim.opt.relativenumber = true

vim.o.mouse = "a"
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10
vim.o.confirm = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- auto open dianostics
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- only open if there are diagnostics on this line
		local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
		if #diags == 0 then
			return
		end

		vim.diagnostic.open_float(nil, {
			focus = false,
			border = "single",
			source = "always",
			prefix = "",
			scope = "cursor",
		})
	end,
})

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "single", source = "if_many" },
	underline = true,

	virtual_text = {
		severity = { min = vim.diagnostic.severity.HINT },
	},
	signs = true,

	jump = { float = true },
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
require("lazy").setup({
	{ import = "plugins" },
}, { ---@diagnostic disable-line: missing-fields
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- matugen theming
local function source_matugen()
	local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua"
	local file, err = io.open(matugen_path, "r")
	if err ~= nil then
		vim.cmd("colorscheme base16-catppuccin-mocha")
	else
		dofile(matugen_path)
		io.close(file)
	end
end

source_matugen()

vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		source_matugen()
		vim.api.nvim_set_hl(0, "Comment", { italic = true })
	end,
})
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

-- adding keybinds
vim.schedule(function()
	require("mappings")
end)
