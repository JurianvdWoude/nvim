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
            {'nvim-tree/nvim-web-devicons'},
            {'meuter/lualine-so-fancy.nvim'},
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'onedark',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '|', right = '|' },
                    globalstatus = true,
                    refresh = {
                        statusline = 100,
                    },
                },
                sections = {
                    lualine_a = {
                        {'fancy_mode', width = 3} 
                    },
                    lualine_b = {
                        {'fancy_branch'},
                        {'fancy_diff'},
                    },
                    lualine_c = {
                        {'fancy_cwd', substitute_home = true}
                    },
                    lualine_x = {
                        {'fancy_macro'},
                        {'fancy_diagnostics'},
                        {'fancy_searchcount'},
                        {'fancy_location'},
                    },
                    lualine_y = {
                        {'fancy_filetype'},
                    },
                    lualine_z = {
                        {'fancy_lsp_servers'}
                    }
                }
            })
        end
    })

    -- Vscode autocomplete pictogram
    use ({'onsails/lspkind.nvim'})

    -- Atom's OneDark style
    use ({
        'navarasu/onedark.nvim',
        as = 'onedark',
        config = function()
            require('onedark').setup {
                style = 'warm',
                transparent = true,
                term_colors = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variable = 'none',
                },
                lualine = {
                    transparent = true,
                },
                colors = {
                    vscode_and = '#4177a4',
                    vscode_str = '#c58a73',
                    vscode_func = '#cdcd9e',
                    vscode_class = '#3c9a87',
                    vscode_param = '#97d5f7',
                    vscode_comnt = '#567d46',
                    vscode_obj = '#45b29b',
                    onedark_red = '#c9616a',
                    onedark_type = '#c3966b',
                },
                highlights = {
                    ['@string'] = {fg = '$vscode_str'},
                    ['@type.builtin'] = {fg = '$vscode_and', fmt = 'italic'},
                    ['@conditional'] = {fg = '$vscode_and'},
                    ['@boolean'] = {fg = '$onedark_type'},
                    ['@keyword.import'] = {fg = '$onedark_red'},
                    ['@function'] = {fg = '$vscode_func'},
                    ['@type'] = {fg = '$vscode_obj'},
                    ['@variable.parameter'] = {fg = '$vscode_param'},
                }
            }
            require('onedark').load()
        end
    })

    -- Diagnostic pretty list
    use ({
        'folke/trouble.nvim',
        requires = {
            {'nvim-tree/nvim-web-devicons'}
        }
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
    use{'ludovicchabant/vim-gutentags'}                         -- Gutentags CTags
    use('theprimeagen/harpoon')                                 -- Harpoon bookmarking
    use{'christoomey/vim-tmux-navigator'}
end)
