return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable pyright / basedpyright
        pyright = { mason = false, autostart = false },
        basedpyright = { mason = false, autostart = false },
        -- disable mypy LSP if you had one
        mypy = { mason = false, autostart = false },
      },
    },
  },
}
