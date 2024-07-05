return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  keys = {
    { "<leader>e",  ":Neotree filesystem toggle<CR>",    desc = "Neotree" },
    { "<leader>bf", ":Neotree buffers reveal float<CR>", desc = "Neotree buffers" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
      window = {
        position = "left",
        width = 30,
      },
    })
  end,
}
