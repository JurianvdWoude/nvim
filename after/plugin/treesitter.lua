require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'javascript', 'typescript', 'lua', 'php', 'c', 'python' },

    -- Do not install parsers synchronously
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
}
