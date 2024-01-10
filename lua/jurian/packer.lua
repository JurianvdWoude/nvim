return require('packer').startup(function(use)
    -- Lets packer manage itself
    use 'wbthomason/packer.nvim'

    -- Show who made code commits
    use 'f-person/git-blame.nvim'

    -- Add in Laravel support
    use 'adalessa/laravel.nvim'

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                         branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Auto-completion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
        }
    }

    -- Lualine Status Bar
    use ({
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            as = 'lualine',
            config = function()
                require('lualine').setup({
                    options = {
                        theme = 'vscode',
                        section_separators = { left = '', right = '' },
                        component_separators = { left = '', right = '' },
                    },
                })
            end
        }
    })

    -- Vscode styling
    use ({
        'Mofiqul/vscode.nvim',
        as = 'vscode',
        config = function()
            vim.o.background = 'dark'
            local color = require('vscode.colors').get_colors()
            require('vscode').setup({
                transparent = true, -- Enable a transparent background
            })
            vim.cmd('colorscheme vscode')
        end
    })

    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}   -- Treesitter parser
    use{'nvim-treesitter/nvim-treesitter-context'}
    use{'ludovicchabant/vim-gutentags'}                         -- Gutentags CTags
    use('theprimeagen/harpoon')                                 -- Harpoon bookmarking
    use{'codota/tabnine-nvim', run = './dl_binaries.sh'}        -- Tabnine auto-completion
    use{'windwp/nvim-ts-autotag'}                               -- Autotag tag-completion
    use{'christoomey/vim-tmux-navigator'}
end)
