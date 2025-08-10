return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>sp",
        function()
          require("fzf-lua").grep({
            search = "",
            cwd = vim.fn.stdpath("data") .. "/lazy/friendly-snippets/snippets",
            prompt = "Snippets> ",
            rg_opts = "--hidden --with-filename --line-number --column --no-heading -g '*.json'",
          })
        end,
        desc = "Fzf Lua Snippets",
      },
    },
  },
}
