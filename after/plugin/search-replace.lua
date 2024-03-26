
-- Highlighted text
vim.keymap.set("v", "<C-s>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>")

-- Current buffer
vim.keymap.set("n", "<leader>sw", "<CMD>SearchReplaceSingleBufferCWord<CR>")
vim.keymap.set("n", "<leader>sW", "<CMD>SearchReplaceSingleBufferCWORD<CR>")

-- File
vim.keymap.set("n", "<leader>sf", "<CMD>SearchReplaceSingleBufferCFile<CR>")

-- Multiple buffers
vim.keymap.set("n", "<leader>ss", "<CMD>SearchReplaceMultiBufferCWord<CR>")
vim.keymap.set("n", "<leader>sS", "<CMD>SearchReplaceMultiBufferCWORD<CR>")

vim.o.inccommand = "split"
