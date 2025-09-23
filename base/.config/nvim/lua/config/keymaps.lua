-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Grep word under cursor
vim.keymap.set("n", "<leader>*", function()
  local word = vim.fn.expand("<cword>")
  require("fzf-lua").grep({ search = word })
end, { desc = "Grep word under cursor" })

-- Resume last FZF search
vim.keymap.set("n", "<leader>sr", function()
  require("fzf-lua").resume()
end, { desc = "Resume last search" })
