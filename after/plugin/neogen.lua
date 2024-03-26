local neogen = require('neogen')

vim.keymap.set("n", "gcd", ":lua require('neogen').generate()<CR>")
