---@diagnostic disable: undefined-doc-name, inject-field, undefined-field
return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- A list of parser names, or "all"
      ensure_installed = {
        "bash",
        "dockerfile",
        "gitignore",
        "lua",
        "json",
        "markdown",
        "python",
        "vim",
        "vimdoc",
        "yaml",
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobject
          keymaps = {
            ["aa"] = { query = "@parameter.outer", desc = "around parameter" },
            ["ia"] = { query = "@parameter.inner", desc = "inside parameter" },
            ["af"] = { query = "@function.outer", desc = "around function" },
            ["if"] = { query = "@function.inner", desc = "inside function" },
            ["ac"] = { query = "@class.outer", desc = "around class" },
            ["ic"] = { query = "@class.inner", desc = "inside class" },
            ["ai"] = { query = "@conditional.outer", desc = "around conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "inside conditional" },
            ["al"] = { query = "@loop.outer", desc = "around loop" },
            ["il"] = { query = "@loop.inner", desc = "inside loop" },
            ["at"] = { query = "@comment.outer", desc = "around comment" },
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function" },
            ["]c"] = { query = "@class.outer", desc = "Next class" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Previous function" },
            ["[c"] = { query = "@class.outer", desc = "Previous class" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
      },
      ---@param opts TSConfig
      config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          ---@type table<string, boolean>
          local added = {}
          opts.ensure_installed = vim.tbl_filter(function(lang)
            if added[lang] then
              return false
            end
            added[lang] = true
            return true
          end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
        vim.schedule(function()
          require("lazy").load({ plugins = { "nvim-treesitter-textobjects" } })
        end)
      end,
    })
  end,
}
