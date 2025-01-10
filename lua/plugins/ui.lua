return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      -- disable smooth scrolling
      scroll = { enabled = false },
    },
  },

  -- add custom colorscheme
  { "sainnhe/sonokai" },

  -- configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
