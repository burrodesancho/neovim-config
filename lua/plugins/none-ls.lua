return {
  "nvimtools/none-ls.nvim",
  enabled = true,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
