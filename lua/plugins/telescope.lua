return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          file_ignore_patterns = {
            ".git",
          },
          hidden = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    require("telescope").load_extension("ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fs", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fz", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fp", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
