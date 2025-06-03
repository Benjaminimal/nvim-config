return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = false,
                UnclosedQuotes = true,
                WrongQuotes = false,
                LongSentences = false,
                RepeatedWords = true,
                Spaces = true,
                Matcher = true,
                CorrectNumberSuffix = true,
              },
            },
          },
        },
      },
    },
  },
}
