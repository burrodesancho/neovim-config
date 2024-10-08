return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]gc", function()
            if vim.wo.diff then
              return "]gc"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[gc", function()
            if vim.wo.diff then
              return "[gc"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hn", gs.next_hunk, { desc = "GitSigns next hunk" })
          map("n", "<leader>hp", gs.prev_hunk, { desc = "GitSigns previous hunk" })
          map("n", "<leader>hs", gs.stage_hunk, { desc = "GitSigns stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "GitSigns reset hunk" })
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "GitSigns stage_hunk" })
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "GitSigns reset_hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "GitSigns stage_buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "GitSigns undo_stage_hunk" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "GitSigns reset_buffer" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "GitSigns preview_hunk" })
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, { desc = "GitSigns blame line" })
          map("n", "<leader>htb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
          map("n", "<leader>hd", gs.diffthis, { desc = "GitSigns diffthis" })
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end, { desc = "GitSigns diffthis" })
          map("n", "<leader>htd", gs.toggle_deleted, { desc = "GitSigns toggle_deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
      end,
    })
  end,
}
