local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = {"--check-untyped-defs"}
        }),
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.blade_formatter,
        -- null_ls.builtins.diagnostics.pint,
    },
})
