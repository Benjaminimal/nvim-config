return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Ensure the structure exists
      opts.sources = opts.sources or {}
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.snippets = opts.sources.providers.snippets or {}
      opts.sources.providers.snippets.opts = opts.sources.providers.snippets.opts or {}

      -- Configure extended filetypes for friendly-snippets
      opts.sources.providers.snippets.opts.extended_filetypes = {
        typescript = { "javascript" },
        typescriptreact = { "javascript", "javascriptreact" },
      }

      return opts
    end,
  },
}
