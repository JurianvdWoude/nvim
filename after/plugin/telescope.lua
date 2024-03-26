local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
-- vim.keymap.set('n', '<leader>fx', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})

-- git commits
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})

-- spell suggestions
vim.keymap.set('n', '<leader>as', builtin.spell_suggest, {})
