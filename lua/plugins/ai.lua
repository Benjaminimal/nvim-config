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
}
