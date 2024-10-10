return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls_status_ok, null_ls = pcall(require, "null-ls")
        if not null_ls_status_ok then
            return
        end

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
            debug = false,
            sources = {
                formatting.prettier.with({ extra_args = { "--no-semi", "--double-quote", "--jsx-single-quote" } }),
                formatting.black.with({ extra_args = { "--fast" } }),
                formatting.stylua,
                diagnostics.flake8,
                code_actions.eslint_d,
            },
        })
    end,
}
