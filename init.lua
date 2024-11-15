-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--[[
-- Show relative numbers to your position.
vim.opt.relativenumber = true

-- Set the the key which is used in special key combinations for hotkeys.
vim.g.mapleader = " "

-- S E T T I N G S
-- The number of spaces that a tab in the file counts for.
vim.opt.tabstop = 4

-- The number of spaces that a tab in the file counts for when editing.
vim.opt.softtabstop = 4

-- The number of spaces to use for (auto)indent.
vim.opt.shiftwidth = 4

-- Use the appropriate number of spaces to insert a tab.
vim.opt.expandtab = true

-- Set the colorscheme
-- vim.opt.color = "evening"

-- Add numbers to each line on the left-hand side.
vim.opt.number = true

-- Highlight cursor line underneath the cursor horizontally.
vim.opt.cursorline = true

-- Never have less than 4 columns below or above your cursor
vim.opt.scrolloff = 4

-- R E M A P S
-- Move to the filesystem.
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

-- Center the cursor after scrolling up or down.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
]]
