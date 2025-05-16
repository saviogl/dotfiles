return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      -- Hide .git/ folder explicitly
      file_ignore_patterns = { "^%.git/" },
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = false, -- respect .gitignore
          no_ignore_parent = false,
        })
      end,
      desc = "Find Files (hidden, gitignored hidden)",
    },
  },
}
