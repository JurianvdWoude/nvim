require('packer').startup(function(use)
   -- Lets packer manage itself
    use 'wbthomason/packer.nvim'

    -- Show who made code commits
    use 'f-person/git-blame.nvim'

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                         branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("harpoon")
            telescope.load_extension("notify")
        end,
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
            {"L3MON4D3/LuaSnip"},
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
                        {'fancy_cwd', substitute_home = true},
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
        },
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

    -- Extended % vim-matchup
    use {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    }

    -- Documentation generation
    use {
        'danymat/neogen',
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        tag = "*"
    }

    -- Debugger
    use {
        "mfussenegger/nvim-dap",
        requires = {
            {'theHamsta/nvim-dap-virtual-text'},
            {'nvim-telescope/telescope-dap.nvim'},
            {'jbyuki/one-small-step-for-vimkind'},
        },
    }

    -- Debugger UI
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }

    use {
        "folke/neodev.nvim",
        requires = {"rcarriga/nvim-dap-ui"},
        config = function()
            require('neodev').setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    }

    -- Search-and-replace package
    use {
        "roobert/search-replace.nvim",
        config = function()
            require("search-replace").setup({
                default_replace_single_buffer_options = "gcI",
                default_replace_multi_buffer_options = "egcI",
            })
        end,
    }

    use{
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup{}
        end,
    }

    -- Comments
    use{
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }

    -- Highlight TODO
    use {
        'folke/todo-comments.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('todo-comments').setup{}
        end,
    }

    -- Github links
    use {
        "9seconds/repolink.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        opt = true,
        cmd = {
            "RepoLink"
        },
        config = function()
            require("repolink").setup({})
        end,
    }

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    }

    -- Move lines
    -- use {
    --     'booperlv/nvim-gomove',
    --     config = function()
    --         require('gomove').setup({
    --             map_defaults = false,
    --             reindent = true,
    --             undojoin = true,
    --             move_past_end_col = false,
    --         })
    --     end,
    --     }

    -- Markdown preview
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })

    -- Env parser
    use {
        "ellisonleao/dotenv.nvim",
        config = function()
            require('dotenv').setup({
                enable_on_load = true,
                verbose = false,
            })
        end,
    }

    -- Linter
    use {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            local lint = require("lint")

            lint.linter_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                svelte = { "eslint_d" },
                terraform = { "tflint" },
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({
                "BufEnter",
                "BufWritePost",
                "InsertLeave"
            }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>fg", function() lint.try_lint() end, { desc = "Trigger linting for the current file" })
        end,
    }

    -- Formatting
    use {
        "stevearc/conform.nvim",
        event = {
            "BufReadPre",
            "BufNewFile"
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    javascriptreact = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    html = { "htmlbeautifier" },
                },
            })
        end,
    }

    use{'onsails/lspkind.nvim'}                                 -- Vscode autocomplete pictogram
    use{'lewis6991/gitsigns.nvim'}                              -- Git sign extension
    use{"aznhe21/actions-preview.nvim"}                         -- Code actions
    use{"sindrets/diffview.nvim"}                               -- Diff view
    use{"nvim-neotest/nvim-nio"}                                -- Async IO
    use{"gelguy/wilder.nvim"}                                   -- Wild menu
    use{"mhartington/formatter.nvim"}                           -- Formatting
    use{'theprimeagen/harpoon'}                                 -- Marking
    use{"mxsdev/nvim-dap-vscode-js"}                            -- Debugging adapter for JS
    use{"mfussenegger/nvim-dap-python"}                         -- Debugging adapter for Python
    use{'folke/zen-mode.nvim'}                                  -- Read mode
    use{'tpope/vim-fugitive'}                                   -- Git integration`
    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}   -- Treesitter parser
    use{'nvim-treesitter/nvim-treesitter-context'}              -- Treesitter context parser
    use{'christoomey/vim-tmux-navigator'}
end)
