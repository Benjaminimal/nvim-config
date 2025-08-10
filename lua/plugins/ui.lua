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
  { "sainnhe/edge" },
  { "sainnhe/sonokai" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/everforest" },
  { "projekt0n/github-nvim-theme" },
  { "rebelot/kanagawa.nvim" },

  -- configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "edge",
    },
  },
}
