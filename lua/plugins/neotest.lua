return {
  "nvim-neotest/neotest",
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        -- runner = "pytest",
        args = { "-n0" },
        -- python = ".venv/bin/python",
      },
    },
  },
}
