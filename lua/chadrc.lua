
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local preferred = "matugen"

M.base46 = {
	theme = "matugen",
	transparency = false,                   -- set to false if you want a solid background

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    " _   _       _             ____ _______        __",
    "| \\ | |_   _(_)_ __ ___   | __ )_   _\\ \\      / /",
    "|  \\| \\ \\ / / | '_ ` _ \\  |  _ \\ | |  \\ \\ /\\ / / ",
    "| |\\  |\\ V /| | | | | | | | |_) || |   \\ V  V /  ",
    "|_| \\_| \\_/ |_|_| |_| |_| |____/ |_|    \\_/\\_/   ",
    "                                                 ",
  },
}
M.ui = {
  tabufline = {
    lazyload = true,
  },

  statusline = {
    theme = "minimal", -- or "vscode", "minimal"
  },
}

return M
