return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup()
  end,
}
