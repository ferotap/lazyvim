return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
    },
    keys = {
      {
        "<leader>sf",
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "live grep with args (^k)",
      },
    },
    opts = {
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = ":lua require('telescope').extensions.live_grep_args.actions.quote_prompt",
              -- ["<C-k>"] = require("telescope-live-grep-args.actions.quote_prompt"),
              -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
    },
  },
}
