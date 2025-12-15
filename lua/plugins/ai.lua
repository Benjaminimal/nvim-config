return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_model = "claude-sonnet-4.5",
      suggestion = {
        keymap = {
          -- accept = "<M-CR>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
    keys = {
      { "<leader>aj", ":Copilot disable<CR>", desc = "Coptilot - Disable" },
      { "<leader>ak", ":Copilot enable<CR>", desc = "Coptilot - Enable" },
    },
  },
}
