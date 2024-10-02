return {
  {
    "kylechui/nvim-surround",
    enabled = true,
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
