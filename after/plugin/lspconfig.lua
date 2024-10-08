local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {}
lspconfig.intelephense.setup {}
lspconfig.anakin_language_server.setup {}
lspconfig.dockerls.setup {}
lspconfig.html.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.ruff_lsp.setup {}
lspconfig.clangd.setup {}
lspconfig.eslint.setup {}
lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
            end
            return true
        end
}



-- Global mappings
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist)

-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        -- Enable completion trigger
        vim.bo[ev.buf].omnifunc = 'vi:lua.vim.lsp.omnifunc'

        -- Buffer local mappings
        local opts = { buffer = ev.buffer }
        vim.keymap.set('n', '<leader>ad', vim.lsp.buf.definition, opts) -- Goto definition
        vim.keymap.set('n', '<leader>at', vim.lsp.buf.type_definition, opt) -- Goto type definition 
        vim.keymap.set('n', '<leader>aD', vim.lsp.buf.declaration, opt) -- Get declaration 
    end ,
})
