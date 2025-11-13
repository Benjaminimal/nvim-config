return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      -- Toggle Chat
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat Toggle" },
      -- Actions picker
      { "<leader>aA", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions" },
      -- Paste selection to chat
      { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "Chat Add" },
    },
    opts = {},
  },
}
