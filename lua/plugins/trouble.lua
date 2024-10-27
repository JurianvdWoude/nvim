return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>ww",
        function() require("trouble").toggle("diagnostics") end,
        desc = "Find Plugin File",
      },
    },
  },
}
