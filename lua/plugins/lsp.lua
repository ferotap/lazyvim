return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
        "lemminx",
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      lspconfig = require("lspconfig")
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
    end,
  },
}
