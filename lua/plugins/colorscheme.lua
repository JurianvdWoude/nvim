return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
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
}
