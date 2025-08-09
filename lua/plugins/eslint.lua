return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
            callback = function()
              -- Just run EslintFixAll command directly
              vim.cmd("EslintFixAll")
            end,
          })
        end,
      },
    },
  },
}
