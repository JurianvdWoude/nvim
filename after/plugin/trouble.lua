local trouble = require('trouble')

vim.keymap.set("n", "<leader>fd", function() trouble.toggle() end)
