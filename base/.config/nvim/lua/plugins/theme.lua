return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,  -- Ensures it loads first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        integrations = {
          treesitter = true,
          telescope = true,
          gitsigns = true,
          cmp = true,
          nvimtree = true,
          which_key = true,
          markdown = true,
          mason = true,
        }
      })
      vim.cmd.colorscheme("catppuccin")
    end
  }
}



