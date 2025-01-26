return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      setup = {
        -- help spectral find it's config file
        spectral = function(_, opts)
          local findRulesetFile = vim.fs.find(".spectral.yaml", { upward = true, type = "file" })
          if #findRulesetFile then
            opts = vim.tbl_deep_extend("force", opts, { settings = { rulesetFile = findRulesetFile[1] } })
          end
          require("lspconfig").spectral.setup(opts)
          return true
        end,
      },
    },
  },
}
