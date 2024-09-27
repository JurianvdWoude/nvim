return {
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/gitsigns.nvim" }, -- Git sign extension
  { "ThePrimeagen/harpoon" }, -- Marking
  { "aznhe21/actions-preview.nvim" }, -- Code actions
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Treesitter parser
  { "nvim-treesitter/nvim-treesitter-context" }, -- Treesitter context parser
  { "gelguy/wilder.nvim" }, -- Wild menu
  { "onsails/lspkind.nvim" }, -- Vscode autocomplete pictogram
  { "mxsdev/nvim-dap-vscode-js" }, -- Debugging adapter for JS
  { "mfussenegger/nvim-dap-python" }, -- Debugging adapter for Python
  { "nvim-neotest/nvim-nio" },

  -- Show who made code commits
  { "f-person/git-blame.nvim" },
  {
    "williamboman/mason.nvim",
    opts = function()
      -- import mason
      local mason = require("mason")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>mf",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        cpp = { "clang-format" },
        php = { "php-cs-fixer" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },
    },
  },
  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "pylint" },
        cpp = { "cpplint" },
        php = { "phpstan" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ml", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  -- Debugger UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "jbyuki/one-small-step-for-vimkind",
    },
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
  },
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    -- or                         branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local telescope = require("telescope")
      telescope.load_extension("harpoon")
      telescope.load_extension("notify")
    end,
  },

  -- Highlight TODO
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      require("todo-comments").setup({})
    end,
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Auto-completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
    },
  },

  -- Lualine Status Bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    opts = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
          globalstatus = true,
          refresh = {
            statusline = 100,
          },
        },
        sections = {
          lualine_a = {
            { "fancy_mode", width = 3 },
          },
          lualine_b = {
            { "fancy_branch" },
            { "fancy_diff" },
          },
          lualine_c = {
            { "fancy_cwd", substitute_home = true },
          },
          lualine_x = {
            { "fancy_macro" },
            { "fancy_diagnostics" },
            { "fancy_searchcount" },
            { "fancy_location" },
          },
          lualine_y = {
            { "fancy_filetype" },
          },
          lualine_z = {
            { "fancy_lsp_servers" },
          },
        },
      })
    end,
  },

  -- Atom's OneDark style
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    opts = function()
      require("onedark").setup({
        style = "warm",
        transparent = true,
        term_colors = true,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variable = "none",
        },
        lualine = {
          transparent = true,
        },
        colors = {
          vscode_and = "#4177a4",
          vscode_str = "#c58a73",
          vscode_func = "#cdcd9e",
          vscode_class = "#3c9a87",
          vscode_param = "#97d5f7",
          vscode_comnt = "#567d46",
          vscode_obj = "#45b29b",
          onedark_red = "#c9616a",
          onedark_type = "#c3966b",
        },
        highlights = {
          ["@string"] = { fg = "$vscode_str" },
          ["@type.builtin"] = { fg = "$vscode_and", fmt = "italic" },
          ["@conditional"] = { fg = "$vscode_and" },
          ["@boolean"] = { fg = "$onedark_type" },
          ["@keyword.import"] = { fg = "$onedark_red" },
          ["@function"] = { fg = "$vscode_func" },
          ["@type"] = { fg = "$vscode_obj" },
          ["@variable.parameter"] = { fg = "$vscode_param" },
        },
      })
      require("onedark").load()
    end,
  },

  -- Diagnostic pretty list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Auto-closing bracket's
  {
    "windwp/nvim-autopairs",
    opts = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Auto-closing tags
  {
    "windwp/nvim-ts-autotag",
    opts = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- Extended % vim-matchup
  {
    "andymass/vim-matchup",
    opts = {
      setup = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
  },

  -- Documentation generation
  {
    "danymat/neogen",
    opts = true,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "folke/neodev.nvim",
    dependencies = { "rcarriga/nvim-dap-ui" },
    opts = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    opts = function()
      require("Comment").setup()
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },

  -- Env parser
  {
    "ellisonleao/dotenv.nvim",
    opts = function()
      require("dotenv").setup({
        enable_on_load = true,
        verbose = false,
      })
    end,
  },

  { "sindrets/diffview.nvim" }, -- Diff view
  { "nvim-neotest/nvim-nio" }, -- Async IO
  { "folke/zen-mode.nvim" }, -- Read mode
  { "tpope/vim-fugitive" }, -- Git integration`
  { "christoomey/vim-tmux-navigator" },
}
