local trouble = require('trouble')

vim.keymap.set("n", "<leader>fw", function() trouble.toggle('diagnostics') end)
