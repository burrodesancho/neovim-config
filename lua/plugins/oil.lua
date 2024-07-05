return {
  "stevearc/oil.nvim",
  enabled = true,
  event = "VeryLazy",
  keys = { { "-", ":Oil<CR>", { desc = "Open parent directory" } }, },
  config = function()
    require("oil").setup()
    -- vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end,
}
