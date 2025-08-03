-- Open the summary panel after running `keymap_rhs`
function summaryOpen(keymap_rhs)
  return function()
    keymap_rhs()
    -- require("neotest").summary.open()
  end
end

return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        -- runner = "pytest",
        args = {
          "-n0",
          "--color=no",
        },
        -- python = ".venv/bin/python",
      },
      ["neotest-vitest"] = {},
    },
    status = { virtual_text = false },
  },
  -- stylua: ignore
  keys = {
    {"<leader>t", "", desc = "+test"},
    { "<leader>tt", summaryOpen(function() require("neotest").run.run(vim.fn.expand("%")) end), desc = "Run File (Neotest)" },
    { "<leader>tT", summaryOpen(function() require("neotest").run.run(vim.uv.cwd()) end), desc = "Run All Test Files (Neotest)" },
    { "<leader>tr", summaryOpen(function() require("neotest").run.run() end), desc = "Run Nearest (Neotest)" },
    { "<leader>tl", summaryOpen(function() require("neotest").run.run_last() end), desc = "Run Last (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
  },
}
