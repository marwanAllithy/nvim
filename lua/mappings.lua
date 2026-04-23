local map = vim.keymap.set

-- standerd
map("n", "s", "cl", { desc = "Delete char and insert" })
map("n", "<C-s>", "<cmd>write<CR>", { desc = "Save file" })
map("i", "<C-s>", "<cmd>write<CR><Esc>", { desc = "Save file" })

-- disable arrow keys
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- moving between split tabs
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- split tabs
map("n", "<C-|>", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<C-->", "<cmd>split<CR>", { desc = "Horizontal split" })
-- open terminal
map("n", "<leader>kt", function()
  local dir = vim.fn.getcwd()   -- always use the session's cwd

  vim.fn.jobstart({
    "kitty",
    "-e",
    "zsh",
    "-c",
    "tmux",
    string.format("cd %q; exec zsh", dir),
  }, {
    detach = true,
  })
end, { desc = "Open Kitty in Neovim CWD" })

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fa', function()
  builtin.find_files({ hidden = true, no_ignore = false })
end, { desc = 'Telescope find all files (including hidden)' })
map('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
