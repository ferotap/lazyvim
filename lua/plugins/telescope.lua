return {
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
  config = function(opts)
    local telescope = require("telescope")
    local ok, lga_actions, lga_shortcuts
    ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
    if not ok then
      vim.notify("telescope-live-grep actions not found", vim.log.levels.ERROR)
    end

    ok, lga_shortcuts = pcall(require, "telescope-live-grep-args.shortcuts")
    if not ok then
      vim.notify("telescope-live-grep actions not found", vim.log.levels.ERROR)
    end

    telescope.setup({
      extensions = {
        ["ui-select"] = {},
        live_grep_args = {
          auto_quoting = false, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-j>"] = lga_actions.quote_prompt({ postfix = " --iglob '**/src/main/java/**'" }),
              ["<C-t>"] = lga_actions.quote_prompt({ postfix = " --iglob '**/src/test/java/**'" }),
            },
          },
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    })
    pcall(require("telescope").load_extension, "live_grep_args")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
