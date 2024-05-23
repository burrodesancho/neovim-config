return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- A list of parser names, or "all"
      ensure_installed = {
        "bash",
        "lua",
        "json",
        "markdown",
        "python",
        "vim",
        "vimdoc",
        "yaml"
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
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
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
      end
    }
  end
}
