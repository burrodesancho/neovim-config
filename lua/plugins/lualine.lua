return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "meuter/lualine-so-fancy.nvim" },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        -- theme = "catppuccin",
        -- theme = "tokyonight",
        theme = "kanagawa",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
          "help",
          "neo-tree",
          "Trouble",
        },
      },
      sections = {
        lualine_a = { "fancy_mode" },
        lualine_b = {
          { "fancy_branch", icon = "" },
          "fancy_diff",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 2 for full path
            symbols = {
              modified = "  ",
              readonly = "  ",
              unnamed = "  ",
            },
          },
        },
        lualine_x = {
          { "fancy_macro", icon = { "󰁥", color = { fg = "#C34043" } } },
          { "fancy_diagnostics" },
          { "progress" },
          { "fancy_location" },
        },
        lualine_y = {
          { "fancy_filetype" },
          { "encoding" },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
