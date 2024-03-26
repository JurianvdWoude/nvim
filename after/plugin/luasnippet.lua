local luasnip = require('luasnip')
vim.keymap.set("i", "<C-S>", function() luasnip.expand() end)
vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump(1) end)
vim.keymap.set({"i", "s"}, "<C-J>,", function() luasnip.jump(-1) end)
