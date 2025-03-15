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
                typeCheckingMode = "off",
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
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        null_ls.builtins.diagnostics.mypy.with({
          -- none-ls passes the file directly to mypy
          -- that way the configured ignores are bypassed
          -- we need to filter ourselves
          runtime_condition = function()
            local ignore_patterns = {
              "tests/",
              "migrations/",
              "__pycache__/",
              ".venv/",
            }
            local filepath = vim.api.nvim_buf_get_name(0)
            for _, pattern in ipairs(ignore_patterns) do
              if filepath:match(pattern) then
                return false
              end
            end
            return true
          end,
        }),
      })
    end,
  },
}
