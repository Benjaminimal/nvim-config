return {

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        -- :h vim.diagnostic.Opts.VirtualText
        virtual_text = {
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            -- don't how hints
            -- vim.diagnostic.severity.HINT,
          },
        },
      },
    },
  },
}
