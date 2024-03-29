local plugins = {

    -- packer can manage itself
    { "wbthomason/packer.nvim" },

    -- better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("bmmvim.utils").configure_plugin("treesitter", { load_keys = false })
        end,
    },
    { -- fixes python autoindentation
        -- ref https://github.com/nvim-treesitter/nvim-treesitter/issues/1136#issuecomment-1127145770
        "yioneko/nvim-yati",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require("bmmvim.utils").configure_plugin("treesitter_context", { load_keys = false })
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("bmmvim.utils").configure_plugin("autopairs", { load_keys = false })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require("bmmvim.utils").configure_plugin("ts_autotag", { load_keys = false })
        end,
    },

    -- comments
    {
        "tpope/vim-commentary",
    },

    -- info lines
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("bmmvim.utils").configure_plugin("lualine", { load_keys = false })
        end,
    },
    {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("bmmvim.utils").configure_plugin("bufferline", { load_keys = false })
        end,
    },

    -- show indentation level
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("indent_blankline", { load_keys = false })
        end,
    },

    -- manage keybinds
    {
        "folke/which-key.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("which_key", { load_keys = false })
        end,
    },

    -- finding things
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("telescope")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },

    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bmmvim.utils").configure_plugin("nvim_tree")
        end,
    },

    -- lsp
    {
        "williamboman/mason.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("mason", { load_keys = false })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = { "mason.nvim", "which-key.nvim" },
        config = function()
            require("bmmvim.utils").configure_plugin("mason_lspconfig", { load_keys = false })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        after = { "mason-lspconfig.nvim", "cmp-nvim-lsp", "telescope.nvim" },
        config = function()
            require("bmmvim.utils").configure_plugin("lspconfig", { load_keys = false })
        end,
    },

    -- autocompletion & snippets
    {
        "rafamadriz/friendly-snippets",
    },
    {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        -- TODO: check if you wan't to put mappings in module
        config = function()
            require("bmmvim.utils").configure_plugin("cmp", { load_keys = false })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        tag = "v1.*",
        config = function()
            require("bmmvim.utils").configure_plugin("luasnip", { load_keys = false })
        end,
    },
    {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip",
    },
    {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua",
    },
    {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-path",
        after = "cmp-buffer",
    },
    {
        "hrsh7th/cmp-calc",
        after = "cmp-path",
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    {
        "gelguy/wilder.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("wilder", { load_keys = false })
        end,
    },

    -- linting & autoformmating
    {
        "jose-elias-alvarez/null-ls.nvim",
        after = "telescope.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("null_ls", { load_keys = false })
        end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("gitsigns", { load_keys = false })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("bmmvim.utils").configure_plugin("fugitive", { load_module = false })
        end,
    },
    {
        "tpope/vim-rhubarb",
        requires = "vim-fugitive",
        config = function()
            require("bmmvim.utils").configure_plugin("rhubarb", { load_module = false })
        end,
    },

    -- respect editorconfig
    {
        "gpanders/editorconfig.nvim",
    },

    -- resize windows
    {
        "simeji/winresizer",
        config = function()
            vim.g.winresizer_start_key = "<C-r>"
            vim.g.winresizer_finish_with_escape = false
            vim.g.winresizer_keycode_cancel = 27
        end,
    },

    -- sane buffer killing
    {
        "moll/vim-bbye",
        config = function()
            require("bmmvim.utils").configure_plugin("bbye", { load_module = false })
        end,
    },

    -- notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },

    -- sourroundings opperators
    {
        "machakann/vim-sandwich",
    },

    -- python virtualenv
    {
        "jmcantrell/vim-virtualenv",
    },

    -- current file tags
    {
        "liuchengxu/vista.vim",
        config = function()
            require("bmmvim.utils").configure_plugin("vista")
        end,
    },

    -- sessions
    {
        "tpope/vim-obsession",
    },

    -- -- autosaving
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("auto_save")
        end,
    },

    -- code folding
    {
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = function()
            require("bmmvim.utils").configure_plugin("ufo")
        end,
    },

    -- toggle quickfx- and locationlist
    {
        "milkypostman/vim-togglelist",
        config = function()
            require("bmmvim.utils").configure_plugin("togglelist", { load_module = false })
        end,
    },

    -- scratchpad
    {
        "m-demare/attempt.nvim",
        after = { "toggleterm.nvim", "telescope.nvim" },
        config = function()
            require("bmmvim.utils").configure_plugin("attempt")
        end,
    },

    -- integrated terminal
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.2.*",
        config = function()
            require("bmmvim.utils").configure_plugin("toggleterm", { load_keys = false })
        end,
    },

    -- task runner
    {
        "jedrzejboczar/toggletasks.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "akinsho/toggleterm.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- to enable YAML config support
        rocks = "lyaml",
        after = "telescope.nvim",
        config = function()
            require("bmmvim.utils").configure_plugin("toggletasks")
        end,
    },

    -- make it pretty
    {
        "sainnhe/sonokai",
        config = function()
            require("bmmvim.utils").configure_plugin("sonokai", { load_keys = false })
        end,
    },
}

local config = {
    auto_clean = true,
    compile_on_sync = true,
    compile_path = vim.fn.stdpath("data") .. "/site/lua/packer_compiled.lua",
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
}

local function ensure_packer()
    -- the root dir to install all plugins. plugins are under opt/ or start/ sub-directory.
    vim.g.plugin_home = vim.fn.stdpath("data") .. "/site/pack/packer"

    -- where to install packer.nvim -- the package manager (we make it opt)
    local install_path = vim.g.plugin_home .. "/start/packer.nvim"

    local fresh_install = vim.fn.glob(install_path) == ""

    if fresh_install then
        vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
        vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    end
    return fresh_install
end

local function startup(fresh_install)
    vim.cmd("packadd packer.nvim")

    local packer = require("packer")

    packer.startup({
        plugins,
        config = config,
    })

    if fresh_install then
        packer.sync()
    else
        local status, _ = pcall(require, "packer_compiled")
        if not status then
            vim.notify("File packer_compiled.lua not found: run PackerSync to fix!", vim.log.levels.ERROR)
        end
    end
end

local M = {}

function M.init()
    local fresh_install = ensure_packer()
    startup(fresh_install)
end

function M.sync()
    require("packer").sync()
end

return M
