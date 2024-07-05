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
    require("noice").setup({
      -- routes = { { view = "notify", filter = { event = "msg_showmode" } } },
    })

    require("notify").setup({ background_color = "#000000" })
    require("lualine").setup({
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
      },
    })
  end,
}
