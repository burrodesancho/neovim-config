return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  transparent_background = true,
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
  },
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}
