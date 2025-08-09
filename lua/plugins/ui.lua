return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      -- disable smooth scrolling
      scroll = { enabled = false },
    },
  },

  -- add custom colorschemes
  { "sainnhe/sonokai" },
  { "sainnhe/gruvbox-material" },
  { "projekt0n/github-nvim-theme" },
  { "olimorris/onedarkpro.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "briones-gabriel/darcula-solid.nvim" },
  { "rose-pine/neovim" },
  { "craftzdog/solarized-osaka.nvim" },
  { "sainnhe/edge" },
  { "navarasu/onedark.nvim" },

  -- configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "edge",
      -- colorscheme = "github_dark_dimmed",
    },
  },
}
