return {
  {
    "williamboman/mason.nvim",
    enabled = true,
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    event = "BufReadPre",
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
    enabled = true,
    opts = {
      inlay_hints = { enabled = true },
    },
    ft = { "lua", "python"},
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Add the border on hover and on signature help popup window
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- Add info icons on the side
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Add border to the diagnostic popup window
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
        },
        float = { border = "rounded", focusable = true },
      })

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        handlers = handlers,
        -- on_attach = function(client, bufnr)
        --   client.server_capabilities.documentFormattingProvider = false
        -- end,
        settings = {
          Lua = {
           hint = { enable = true },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            format = {
              enable = false,
            },
          },
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        handlers = handlers,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto reference" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbol" })
    end,
  },
}
