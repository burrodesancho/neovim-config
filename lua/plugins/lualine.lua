return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
      },
      sections = {
        lualine_a = {
          {
            "filename",
            path = 1,
          },
        },
      },
    })
  end,
}
