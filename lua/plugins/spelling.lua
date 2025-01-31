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
                spelled_numbers = false,
                an_a = false,
                sentence_capitalization = false,
                unclosed_quotes = false,
                wrong_quotes = false,
                long_sentences = false,
                repeated_words = false,
                spaces = false,
                matcher = false,
                correct_number_suffix = false,
                number_suffix_capitalization = false,
                multiple_sequential_pronouns = false,
                linking_verbs = false,
                avoid_curses = false,
                terminating_conjunctions = false,
                ellipsis_length = false,
                dot_initialisms = false,
                boring_words = false,
                use_genitive = false,
                that_which = false,
                capitalize_personal_pronouns = false,
                americas = false,
                koreas = false,
                chinese_communist_party = false,
                united_organizations = false,
                holidays = false,
                amazon_names = false,
                google_names = false,
                meta_names = false,
                microsoft_names = false,
                apple_names = false,
                azure_names = false,
                merge_words = false,
                plural_conjugate = false,
                oxford_comma = false,
                pronoun_contraction = false,
                currency_placement = false,
                somewhat_something = false,
                lets_confusion = false,
                spell_check = true,
              },
            },
          },
        },
      },
    },
  },
}
