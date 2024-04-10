local actions = require("actions-preview")
vim.keymap.set({"v", "n"}, "<leader>fe", actions.code_actions)
