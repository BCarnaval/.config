-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  {
    "catppuccin/nvim",
    name = "catppucin",
  },
  {
    "hura/vim-asymptote",
    name = "vim-asymptote",
    lazy = false,
  },
  {
    "lervag/vimtex",
    ft = "tex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_view_method = "skim"
    end,
  },
  {
    "ntpeters/vim-better-whitespace",
    name = "vim-better-whitespace",
    config = function() vim.g.better_whitespace_guicolor = "#FAC898" end,
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function() vim.g.mkdp_refresh_slow = 1 end,
    ft = { "markdown" },
    lazy = false,
  },
  {
    "mechatroner/rainbow_csv",
    name = "rainbow_csv",
    lazy = false,
  },
  {
    "savq/melange-nvim",
    lazy = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
  },
  {
    "sainnhe/everforest",
    config = function() vim.g.everforest_background = "soft" end,
    lazy = true,
  },
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd.colorscheme "gruvbox"
      vim.o.background = "light"
    end,
    lazy = false,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
