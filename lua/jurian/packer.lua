return require('packer').startup(function(use)
    -- Lets packer manage itself
    use 'wbthomason/packer.nvim'

    -- Show who made code commits
    use 'f-person/git-blame.nvim'

    -- Add in Laravel support
    use {
        "adalessa/laravel.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        }
    }

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
            {'saadparwaiz1/cmp_luasnip'},
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

    -- Vscode autocomplete pictogram
    use ({'onsails/lspkind.nvim'})

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

    -- Auto-closing bracket's
    use ({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    })

    -- Auto-closing tags
    use ({
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup {}
        end
    })

    -- Git sign extension
    use({'lewis6991/gitsigns.nvim'})

    -- Linting and code checking
    use({'nvimtools/none-ls.nvim'})

    -- File tree
    use({
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
        end
    })

    use{'tpope/vim-fugitive'}                                   -- Git integration`
    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}   -- Treesitter parser
    use{'nvim-treesitter/nvim-treesitter-context'}              -- Treesitter context parser
    use('theprimeagen/harpoon')                                 -- Harpoon bookmarking
    use{'christoomey/vim-tmux-navigator'}
end)
