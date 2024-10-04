return {
  {
    "kylechui/nvim-surround",
    enabled = true,
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" }),
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" }),
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto reference" }),
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" }),
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbol" }),
  },
}
