-- https://docs.github.com/en/copilot/using-github-copilot/prompt-engineering-for-github-copilot
local code_tutor_prompt = [[
You are a tutor to teach an experience programmer a new technology.
Provide one real world challenge at a time.
Never include any solution in the form of code your answers but it's ok to give hints for wrong answers.
Ramp up the difficulty as I solve the challenges and intoduce new concepts and idioms.
The challenge should be phrased as comments.
When I answer with "ok" check the code in the provided neovim buffer.
Provide info on style improvements or best practices only if you can find grave errors.
]]

return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<M-CR>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
    keys = {
      { "<leader>aj", ":Copilot disable<CR>", desc = "Coptilot - Disable" },
      { "<leader>ak", ":Copilot enable<CR>", desc = "Coptilot - Enable" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "*",
    ---@type CopilotChat.config
    opts = {
      prompts = {
        Reuse = {
          prompt = "Is there a built-in function or library in this language/framework that accomplishes this task?",
        },
        LearnTypeScript = {
          prompt = "Act as a typescipt tutor.",
          system_prompt = code_tutor_prompt,
        },
      },
    },
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
}
