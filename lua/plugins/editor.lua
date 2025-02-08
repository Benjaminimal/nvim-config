return {
  { "folke/flash.nvim", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "ibhagwan/fzf-lua",
    opts = function()
      local config = require("fzf-lua.config")
      local actions = require("trouble.sources.fzf").actions
      config.defaults.actions.files["alt-t"] = actions.open
    end,
    keys = {
      { "<leader>sf", "<cmd>FzfLua builtin<cr>", desc = "Fzf builtin" },
      { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
      { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
      { "<leader>sl", "<cmd>FzfLua grep_loclist<cr>", desc = "Location List" },
      { "<leader>sq", "<cmd>FzfLua grep_quickfix<cr>", desc = "Quickfix List" },
    },
  },
  {
    "folke/trouble.nvim",
    -- TODO: this cuases an error
    -- opts = function()
    --   -- alyways use toruble for opening quickfix and loclist
    --   -- See https://github.com/folke/trouble.nvim/issues/428
    --   vim.api.nvim_create_autocmd("BufRead", {
    --     callback = function(ev)
    --       if vim.bo[ev.buf].buftype == "quickfix" then
    --         local is_loclist = vim.fn.getwininfo(vim.fn.win_getid())[0]["loclist"] == 1
    --         if is_loclist then
    --           vim.schedule(function()
    --             vim.cmd([[lclose]])
    --             vim.cmd([[Trouble loclist open]])
    --           end)
    --         else
    --           vim.schedule(function()
    --             vim.cmd([[cclose]])
    --             vim.cmd([[Trouble qflist open]])
    --           end)
    --         end
    --       end
    --     end,
    --   })
    -- end,
    keys = {
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle focus=true<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle focus=true<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>lopen<cr>",
        desc = "Location List",
      },
      {
        "<leader>xQ",
        "<cmd>copen<cr>",
        desc = "Quickfix List",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>z", group = "notes", icon = { icon = " ", color = "white" } },
          { "<leader>i", group = "chat", icon = { icon = "󰭹 ", color = "green" } },
        },
      },
    },
  },
}
