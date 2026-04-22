-- standerd
vim.keymap.set("n", "s", "cl", { desc = "Delete char and insert" })
vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<cmd>write<CR><Esc>", { desc = "Save file" })

-- disable arrow keys
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- moving between split tabs
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')


-- open terminal
vim.keymap.set("n", "<leader>kt", function()
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
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>tc", ":lua require('nvchad.tabufline').close_buffer()<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>to", ":lua require('nvchad.tabufline').close_other_buffers()<CR>", { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>tp", ":lua require('nvchad.tabufline').prev()<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>tn", ":lua require('nvchad.tabufline').next()<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>tP", ":lua require('nvchad.tabufline').pin_buffer()<CR>", { desc = "Pin buffer" })
vim.keymap.set("n", "<leader>tw", ":lua require('nvchad.tabufline').move_buf()<CR>", { desc = "Move buffer to next tab" })
