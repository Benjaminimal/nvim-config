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
          "-vv",
        },
        -- python = ".venv/bin/python",
      },
      ["neotest-vitest"] = {},
    },
    status = { virtual_text = false },
  },
}
