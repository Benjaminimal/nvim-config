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
  {
    "sainnhe/edge",
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_diagnostic_virtual_text = "colored"
      vim.g.edge_current_word = "high contrast background"
      vim.g.edge_inlay_hints_background = "dimmed"
      vim.g.edge_colors_override = {
        grey = { "#8790a0", "246" }, -- make code comments more visible
      }
    end,
  },
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
