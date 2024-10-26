return {
  "williamboman/mason.nvim",
  enabled = true,
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
    mason.setup({
      ui = { border = border },
    })

    mason_lspconfig.setup({

      ensure_installed = { "lua_ls", "pyright", "ruff" },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "stylua",
        "isort",
        "mypy",
      },
    })
  end,
}
