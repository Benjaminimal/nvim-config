return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true, -- delegate to ruff
              analysis = {
                -- typeCheckingMode = "strict",
                -- NOTE: uncomment this to ignore linting. Good for projects where
                -- basedpyright lights up as a christmas tree.
                typeCheckingMode = "basic",
                ignore = { "*" },
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                inlayHints = {
                  variableTypes = false,
                  callArgumentNames = false,
                  functionReturnTypes = false,
                  genericTypes = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
