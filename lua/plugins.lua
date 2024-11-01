local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    -- theme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          which_key = true,
        },
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function() require("nvim-surround").setup {} end,
    keys = { "cs", "ds", "ys" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {
        indent = {
          char = "┊",
        },
      }
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
      },
    },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("config.gitsigns") end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require(1fidget').setup({})`
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
      },
      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
    },
    config = function() require("config.cmp") end,
    event = { "InsertEnter" },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function() return vim.fn.executable("make") == 1 end,
      },
    },
    event = "VeryLazy",
    config = function() require("config.telescope") end,
  },
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function() require("config.nvim-treesitter") end,
    event = { "BufReadPre", "BufNewFile" },
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    config = function() require("config.trouble") end,
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("config.hop") end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function() require("config.null_ls") end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "davidmh/cspell.nvim",
    },
  },
  {
    "FabijanZulj/blame.nvim",
    config = function() require("config.blame") end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "stevearc/oil.nvim",
    config = function() require("config.oil") end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    name = "colorizer",
    config = function() require("colorizer").setup() end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
      on_attach = function(client, buf)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        require("helpers.lsp").on_attach(client, buf)
      end,
    },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {},
    cmd = "TSC",
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4", -- Recommended,
    lazy = false,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = true,
      }
    end,
  },
  require("kickstart.plugins.autoformat"),
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "rescript-lang/vim-rescript",
    ft = "rescript",
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      show_icons = true,
      leader_key = ",", -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings
    },
  },
}, {})
