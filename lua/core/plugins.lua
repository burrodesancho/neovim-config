local plugins ={
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  },
  "tpope/vim-commentary",
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
  },
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
  },
  "tpope/vim-surround",
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
  -- Visualize buffers as tabs
  { "akinsho/bufferline.nvim", 
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
}

opts = {
  ui = {
    border = "rounded",
  },
}

require("lazy").setup(plugins, opts)
