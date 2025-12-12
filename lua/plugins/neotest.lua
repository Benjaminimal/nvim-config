return {
  "nvim-neotest/neotest",
  opts = function(_, opts)
    opts.status = opts.status or {}
    -- enabling this would display test results in the gutter and as virtual text
    opts.status.virtual_text = false
  end,
}
