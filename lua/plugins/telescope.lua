return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          file_ignore_patterns = {
            "%.git",
            ".mypy*",
            "*venv*",
          },
          hidden = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("noice")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
    vim.keymap.set("n", "<leader>fz", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "List Help Tags" })
  end,
}
