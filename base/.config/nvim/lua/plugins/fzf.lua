return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    files = {
      -- Show hidden files, but still respect .gitignore
      hidden = true,
      -- Use fd (faster) if installed, or fallback to find
      fd_opts = "--color=never --type f --hidden --follow --exclude .git",
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find Files (FZF)",
    },
  },
}
