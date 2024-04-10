local dbee = require('dbee')
local dbee_source = require("dbee.sources")

-- local db_table = {}
-- db_table[1] = "mysql"
-- db_table[2] = "://"
-- db_table[3] = vim.fn.execute(":DotenvGet DB_USERNAME")
-- db_table[4] = ":"
-- db_table[5] = vim.fn.execute(":DotenvGet DB_PASSWORD")
-- db_table[6] = "@localhost:"
-- db_table[7] = vim.fn.execute(":DotenvGet DB_PORT")
-- local db_str = table.concat(db_table):gsub("%s+", "")
-- 
-- dbee.setup{
--     sources = {
--         -- dbee_source.EnvSource:new("DBEE_CONNECTIONS"),
--         dbee_source.MemorySource:new({
--             {
-- 
--                 name = "db",
--                 url = db_str,
--                 type = "mysql",
--             }
--         })
--     }
-- }

vim.keymap.set("n", "<leader>pp", "<CMD>:Dbee<CR>")
-- vim.keymap.set("n", "<leader>p;", dbee.api.ui.result_page_prev())
-- vim.keymap.set("n", "<leader>p,", dbee.api.ui.result_page_next())
-- vim.keymap.set("n", "<leader>pn", dbee.api.ui.result_page_last())
-- vim.keymap.set("n", "<leader>pN", dbee.api.ui.result_page_first())
