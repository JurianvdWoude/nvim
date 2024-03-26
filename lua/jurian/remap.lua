vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>fs", '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set("n", "<leader>fs", '<CMD>:Ex<CR>', { desc = 'Open parent directory' })
vim.keymap.set("n", "<C-u>", '<C-u>zz', { desc = 'Move up a screen' })
vim.keymap.set("n", "<C-d>", '<C-d>zz', { desc = 'Move down a screen' })

vim.keymap.set("n", "<leader>+", '<CMD>vertical resize +5<CR>', { desc = 'Make window vertically bigger' })
vim.keymap.set("n", "<leader>=", '<CMD>horizontal resize +2<CR>', { desc = 'Make window horizontally bigger' })
vim.keymap.set("n", "<leader>_", '<CMD>vertical resize -5<CR>', { desc = 'Make window vertically smaller' })
vim.keymap.set("n", "<leader>-", '<CMD>horizontal resize -2<CR>', { desc = 'Make window horizontally smaller' })

vim.keymap.set("n", "<leader>h", '<C-w>h', { desc = 'Move to the left window' })
vim.keymap.set("n", "<leader>j", '<C-w>j', { desc = 'Move to the below window' })
vim.keymap.set("n", "<leader>k", '<C-w>k', { desc = 'Move to the above window' })
vim.keymap.set("n", "<leader>l", '<C-w>l', { desc = 'Move to the right window' })

vim.keymap.set("n", "<leader>ti", '<CMD>!bash ~/.dotfiles/scripts/start_sesh.sh<CR>', { desc = 'Start all tmux sessions'})
vim.keymap.set("n", "<leader>tx", '<CMD>!bash ~/.dotfiles/scripts/kill_sesh.sh<CR>', { desc = 'Kill all tmux sessions'})
