vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.wrap = false -- disable line wrapping

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- unless capital letter in search

vim.opt.hlsearch = true -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true -- incrementally highlight searches as you type

vim.opt.termguicolors = true -- enable true color support
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 --minimum number of columns to keep above and below the cursor

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.swapfile = false
vim.opt.backup = false

-- Make sure undodir works on Windows
local home = os.getenv("HOME")
if home == nil then
  home = os.getenv("UserProfile")
end
vim.opt.undodir = home .. "/.nvim/undodir"
vim.opt.undofile = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

if not vim.g.vscode then
  -- Navigate vim panes better
  vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to the upper pane", silent = true })
  vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to the lower pane", silent = true })
  vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to the left pane", silent = true })
  vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to the right pane", silent = true })
end

--  Remove highlighted text after search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No Highlight Search", silent = true })

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard", silent = true })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Buffers
vim.keymap.set("n", "<leader>p", ":bp<CR>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "<leader>n", ":bn<CR>", { desc = "Next Buffer", silent = true })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close Buffer", silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the cursor at the same place after joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Replace the word at current position
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]],
  { desc = "Replace the word under the cursor", silent = true }
)

-- Show inline messages
-- Show in floating window
vim.keymap.set(
  "n",
  "<leader>do",
  "<cmd>lua vim.diagnostic.open_float()<CR>",
  { desc = "Inline message to floating windows" }
)
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next message" })
vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous message" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>hh", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle Inlay Hints" })
end
