return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyrefly",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable pyright / basedpyright
        pyright = { mason = false, autostart = false },
        basedpyright = { mason = false, autostart = false },
        -- disable mypy LSP
        mypy = { mason = false, autostart = false },
      },
    },
  },
  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        -- runner = "pytest",
        args = {
          "-n0",
          "--color=no",
          "-vv",
        },
        -- python = ".venv/bin/python",
      }
      return opts
    end,
  },
}
