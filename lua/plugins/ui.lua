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
  { "ellisonleao/gruvbox.nvim" },
  { "projekt0n/github-nvim-theme" },

  -- configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
