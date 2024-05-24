return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Add the border on hover and on signature help popup window
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- Add border to the diagnostic popup window
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
        },
        float = { border = "rounded", focusable = true },
      })

      local lspconfig = require("lspconfig")
      lspconfig.html.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        handlers = handlers,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        handlers = handlers,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}