return {
  "neovim/nvim-lspconfig",
  enabled = true,
  opts = {
    inlay_hints = { enabled = true },
  },
  -- ft = { "lua", "python" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Add the border on hover and on signature help popup window
    local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
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
      float = { border = border, focusable = true },
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
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
      },
      python = {
        analysis = {
          -- Ignore all files for analzsis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    })

    lspconfig.ruff.setup({
      init_options = {
        settings = {
          args = {},
          lint = { enable = false },
        },
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to reference"
        vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, opts)

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Show available code actions"
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Document symbols"
        vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_document_symbols<CR>", opts)
        -- vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
    })
  end,
}
