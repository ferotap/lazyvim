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
    opts = {
      autoformat = false,
      format = {
        formatting_options = {},
      },
    },
  },
}
