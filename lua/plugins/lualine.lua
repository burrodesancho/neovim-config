return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "meuter/lualine-so-fancy.nvim" },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status")

    -- local colors = {
    --   blue = "#65D1FF",
    --   green = "#3EFFDC",
    --   violet = "#FF61EF",
    --   yellow = "#FFDA7B",
    --   red = "#FF4A4A",
    --   fg = "#c3ccdc",
    --   bg = "#112638",
    --   inactive_bg = "#2c3043",
    -- }

    -- local my_lualine_theme = {
    --   normal = {
    --     a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   insert = {
    --     a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   visual = {
    --     a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   command = {
    --     a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   replace = {
    --     a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   inactive = {
    --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
    --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --   },
    -- }

    lualine.setup({
      options = {
        icons_enabled = true,
        -- theme = "catppuccin",
        -- theme = "tokyonight",
        -- theme = my_lualine_theme,
        theme = "kanagawa",
        component_separators = { left = "|", right = "|" },
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
          "fancy_branch",
          "fancy_diff",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 2 for full path
            symbols = {
              modified = "  ",
              -- readonly = "  ",
              -- unnamed = "  ",
            },
          },
          -- { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
          -- { "fancy_searchcount" },
        },
        lualine_x = {
          { "fancy_mode" },
        },
        lualine_y = {
          { "fancy_diagnostics" },
          { "progress" },
          { "fancy_location" },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { "filename" },
      --   -- lualine_x = { "location" },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- tabline = {},
      extensions = { "neo-tree", "lazy" },
      -- sections = {
      --   lualine_a = {
      --     {
      --       "filename",
      --       path = 1,
      --     },
      --   },
      -- },
      -- sections = {
      --   lualine_x = {
      --     {
      --       lazy_status.updates,
      --       cond = lazy_status.has_updates,
      --       color = { fg = "#ff9e64" },
      --     },
      --     { "encoding" },
      --     { "fileformat" },
      --     { "filetype" },
      --   },
      -- },
    })
  end,
}
