return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "*",
    keys = {
      -- Load existing chat
      {
        "<leader>al",
        ":CopilotChatLoad ",
        desc = "CopilotChat - Load Chat",
      },
      -- Store current chat
      {
        "<leader>as",
        function()
          local input = vim.fn.input("Save Chat: ")
          if input ~= "" then
            require("CopilotChat").save(input)
          end
        end,
        ft = "copilot-chat",
        desc = "CopilotChat - Save Chat",
      },
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
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "cat " .. vim.fn.expand("~/.config/openai.key"),
        actions_paths = {
          vim.fn.expand("~/.config/nvim/lua/plugins/chatgpt.actions.json"),
        },
        openai_params = {
          model = "gpt-4o-mini",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 16384,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
        openai_edit_params = {
          model = "gpt-4o-mini",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 16384,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      })
    end,
    keys = {
      { "<leader>ii", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      { "<leader>ie", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
      { "<leader>ig", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
      { "<leader>it", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
      { "<leader>ik", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
      { "<leader>id", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
      { "<leader>ia", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
      { "<leader>io", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
      { "<leader>is", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
      { "<leader>if", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
      { "<leader>ix", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
      -- { "<leader>ir", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
      {
        "<leader>il",
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        desc = "Code Readability Analysis",
        mode = { "n", "v" },
      },
    },
  },
}
