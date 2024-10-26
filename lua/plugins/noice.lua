return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local border_style = {
      top_left = "┌",
      top = "─",
      top_right = "┐",
      left = "│",
      right = "│",
      bottom_left = "└",
      bottom = "─",
      bottom_right = "┘",
    }

    require("noice").setup({
      vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "#c5c9c5" }), -- white border color
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#c5c9c5", bg = "none" }), -- white border color
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = border_style, padding = { 0, 1 } },
          win_options = {
            winhighlight = {
              Normal = "TelescopePromptNormal",
              CursorLine = "TelescopePromptNormal",
              FloatBorder = "DiagnosticInfo",
            },
          },
        },
        -- cmdline_popupmenu = {
        --   position = { row = 8, col = "50%" },
        --   size = { width = 60, height = "auto" },
        --   border = { style = border_style, padding = { 0, 1 } },
        --   win_options = {
        --     winhighlight = {
        --       Normal = "TelescopePromptNormal",
        --       CursorLine = "TelescopePromptNormal",
        --       FloatBorder = "DiagnosticInfo",
        --     },
        --   },
        -- },
        -- popup = {
        --   border = { style = border_style, padding = { 0, 1 } },
        --   win_options = { winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" } },
        -- },
        -- popupmenu = {
        --   relative = "editor",
        --   position = { row = 8, col = "50%" },
        --   size = { width = 60, height = "auto" },
        --   border = { style = border_style, padding = { 0, 1 } },
        --   win_options = { winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" } },
        -- },
      },
    })

    require("notify").setup({ background_color = "#000000" })

    vim.keymap.set("n", "<leader>md", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
  end,
}
