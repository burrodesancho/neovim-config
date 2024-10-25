return {
  "akinsho/bufferline.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- after = "catppuccin",
  config = function()
    require("bufferline").setup({
      -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { desc = "BufferLine", silent = true })
  end,
}
