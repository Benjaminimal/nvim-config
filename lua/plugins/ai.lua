return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    verion = "*",
    keys = {
      -- Ask the Perplexity agent a quick question
      {
        "<leader>as",
        function()
          local input = vim.fn.input("Perplexity: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              agent = "perplexityai",
              selection = false,
            })
          end
        end,
        desc = "CopilotChat - Perplexity Search",
        mode = { "n", "v" },
      },
    },
  },
}
