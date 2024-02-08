local lua_ls_settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT'
    },
    diagnostics = {
      globals = {
        'vim'
      },
    },
    workspace = {
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.stdpath('config')] = true,
      },
    },
    telemetry = { enabled = false },
  }
}
return {
  {
    "williamboman/mason.nvim",
    opts = {
      enkure_installed = {
        "jdtls",
        "lemminx",
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.jdtls.setup({
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = "/opt/kela/java/default",
                  default = true,
                },
              },
            },
          },
        },
      })
      lspconfig.lemminx.setup({
        settings = {}
      })
      lspconfig.lua_ls.setup({
        settings = lua_ls_settings
      })
    end
  },
}
