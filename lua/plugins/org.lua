-- Return a table of iso-dates of days of the working week starting from Monday.
local function get_current_work_week_days()
  local days = { "monday", "tuesday", "wednesday", "thursday", "friday" }
  local current_time = os.time()
  local current_day = os.date("*t", current_time).wday
  local days_to_monday = (current_day - 2) % 7
  local monday_time = current_time - (days_to_monday * 24 * 60 * 60)

  local week_days = {}
  for i, day in ipairs(days) do
    local day_time = monday_time + ((i - 1) * 24 * 60 * 60)
    week_days[day] = os.date("%Y-%m-%d", day_time)
  end

  return week_days
end

return {
  {
    -- https://zk-org.github.io/zk/
    -- https://github.com/zk-org/zk
    -- https://github.com/zk-org/zk-nvim
    "zk-org/zk-nvim",
    -- lazy = false,
    version = "*",
    config = function()
      require("zk").setup({
        picker = "fzf_lua",

        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
    keys = {
      -- Open notes.
      {
        "<leader>fz",
        function()
          require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
        end,
        desc = "Notes",
      },
      -- Open notes associated with the selected tags.
      {
        "<leader>sz",
        function()
          require("zk.commands").get("ZkTags")()
        end,
        desc = "Tags in Notes",
      },
      -- Create a new note after asking for its title.
      {
        "<leader>zz",
        function()
          require("zk.commands").get("ZkNew")({ title = vim.fn.input("Title: ") })
        end,
        desc = "New Note",
      },
      -- Create a new note with title as the current visual selection.
      {
        "<leader>zz",
        ":'<,'>ZkNewFromTitleSelection<CR>",
        mode = "v",
        desc = "New Note with Selection as Title",
      },
      -- Create a new note with content as the current visual selection.
      {
        "<leader>zv",
        ":'<,'>ZkNewFromContentSelection<CR>",
        mode = "v",
        desc = "New Note with Selection as Content",
      },
      -- Create or access weekly journal.
      {
        "<leader>zw",
        function()
          require("zk.commands").get("ZkNew")({ group = "journal-weekly", extra = get_current_work_week_days() })
        end,
        desc = "Weekly Note",
      },
      -- Opens a notes picker for the backlinks of the current buffer
      {
        "<leader>zb",
        function()
          require("zk.commands").get("ZkBacklinks")()
        end,
        desc = "Search for Backlinks",
      },
      -- Look at recent notes
      {
        "<leader>zr",
        function()
          require("zk.commands").get("ZkNotes")({ modifiedAfter = "2 days ago", sort = { "modified" } })
        end,
        desc = "Search for Backlinks",
      },
      -- Search for the notes matching a given query.
      -- TODO: this errs
      -- Error executing vim.schedule lua callback: ...e/benjaminimal/.local/share/nvim/lazy/zk-nvim/lua/zk.lua:104: RPC[Error] code_name = InvalidRequest, message = "failed to parse zk.tag.list args, got: map[match:fo select:[title absPath path] sort:[modified]]: json: cannot unmarshal string into Go struct field cmdListOpts.match of type []string"
      {
        "<leader>zs",
        function()
          require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = vim.fn.input("Search: ") })
        end,
        desc = "Query Notes",
      },
      -- Search for the notes matching the current visual selection.
      {
        "<leader>zs",
        ":'<,'>ZkMatch<CR>",
        mode = "v",
        desc = "Search Visual Selection in Notes",
      },
      -- Inserts a link at the cursor location or around the selected text
      -- TODO: take a look at integrating completion
      -- TODO: looks like this breaks pressing <TAB> in insert mode
      -- {
      --   "<C-i>",
      --   function()
      --     require("zk.commands").get("ZkInsertLink")()
      --   end,
      --   mode = "i",
      --   desc = "Insert Link to Note",
      -- },
      {
        "<leader>zi",
        ":'<,'>ZkInsertLinkAtSelection<CR>",
        mode = "v",
        desc = "Insert Link to Note",
      },
    },
  },
  -- automatic time tracking
  {
    "wakatime/vim-wakatime",
    lazy = false,
    version = "*",
  },
}
