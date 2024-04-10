local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require('harpoon.tmux')

require("harpoon").setup({
    global_settings = { enter_on_sendcmd = true }
})

vim.keymap.set("n", "<leader>fa", mark.add_file)
vim.keymap.set("n", "<leader>f0a", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>f1a", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>f2a", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>f3a", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>f4a", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>f5a", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>f6a", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>f7a", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>f8a", function() ui.nav_file(8) end)

vim.keymap.set("n", "<leader>f9a", mark.clear_all)

vim.keymap.set("n", "<leader>te", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>tr", function() term.sendCommand(2, "ranger") end, { desc = 'Open up the ranger file explorer' })
vim.keymap.set("n", "<leader>gg", function() term.sendCommand(3, "lazygit") end, { desc = 'Open up lazygit' })
vim.keymap.set("n", "<leader>ts", function() term.sendCommand(4, 'sesh') end, { desc = 'Go to a different tmux session' })
vim.keymap.set("n", "<leader>td", function()
    local db_table = {}
    db_table[1] = vim.fn.execute(":DotenvGet DB_CONNECTION")
    db_table[2] = "://"
    db_table[3] = vim.fn.execute(":DotenvGet DB_USERNAME")
    db_table[4] = ":"
    db_table[5] = vim.fn.execute(":DotenvGet DB_PASSWORD")
    db_table[6] = "@localhost:"
    db_table[7] = vim.fn.execute(":DotenvGet DB_PORT")
    local db_str = table.concat(db_table):gsub("%s+", "")
    term.sendCommand(5, "usql " .. db_str .. " --command='SHOW DATABASES';usql " .. db_str)


end, { desc = 'Open up database' })

