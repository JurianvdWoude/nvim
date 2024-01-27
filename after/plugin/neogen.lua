local neogen = require('neogen')

vim.keymap.set("n", "<leader>fd", ":lua require('neogen').generate()<CR>")
