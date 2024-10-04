local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")

if vim.g.vscode then
  -- VScode stuff
  require("lazy").setup("vscode_stuff")
else
  -- Regular nvim
  local opts = {
    ui = {
      border = "rounded",
    },
  }
  
  require("lazy").setup("plugins", opts)
end
