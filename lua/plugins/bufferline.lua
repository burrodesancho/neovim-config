return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
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

    vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>")
  end,
}
