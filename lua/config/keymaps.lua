-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<cmd>!tmux select-pane -L<cr>", { desc = "Move to Left Tmux Pane", remap = true })
vim.keymap.set("n", "<C-j>", "<cmd>!tmux select-pane -D<cr>", { desc = "Move to Lower Tmux Pane", remap = true })
vim.keymap.set("n", "<C-k>", "<cmd>!tmux select-pane -U<cr>", { desc = "Move to Upper Tmux Pane", remap = true })
vim.keymap.set("n", "<C-l>", "<cmd>!tmux select-pane -R<cr>", { desc = "Move to Right Tmux Pane", remap = true })

vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
