return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_model = "claude-sonnet-4.5",
      suggestion = {
        auto_trigger = false,
        keymap = {
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
    keys = {
      {
        "<leader>aj",
        function()
          require("copilot.suggestion").toggle_auto_trigger()
          vim.notify("Copilot auto_trigger toggled", vim.log.levels.INFO)
        end,
        desc = "Coptilot - Toggle Auto Trigger",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      interactions = {
        chat = {
          variables = {},
          keymaps = {
            next_chat = false,
            previous_chat = false,
            -- This deletes the open chat
            -- We want "q" to toggle it when open
            -- close = { modes = { n = "q" } },
            stop = { modes = { n = "<C-x>" } },
          },
        },
      },
    },
    keys = {
      -- Actions picker
      { "<leader>fa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
      -- Toggle Chat
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat Toggle" },
      -- Paste selection to chat
      { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "Chat Add" },
      -- Open inline assistant
      { "<leader>av", ":CodeCompanion ", mode = { "n", "v" }, desc = "Inline Assistant" },
    },
  },
}
