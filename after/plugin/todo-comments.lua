local todo = require('todo-comments')

vim.keymap.set("n", "gc;", function() todo.jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "gc,", function() todo.jump_prev() end, { desc = "Prev todo comment" })
