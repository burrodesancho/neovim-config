return {
  "catppuccin/nvim",
  enabled = true,
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      styles = {                         -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },         -- Change the style of comments
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        mason = true,
        native_lsp = { enabled = true },
        neotree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
