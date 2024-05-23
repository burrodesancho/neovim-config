return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end
}
