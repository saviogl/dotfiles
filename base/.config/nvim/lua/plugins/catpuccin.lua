return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          -- match wezterm: subtle block selection
          Visual = { bg = "#494D64" }, -- Surface1
          -- (optional) make searches pop a bit like tmux:
          Search = { fg = "#181926", bg = "#EED49F" }, -- Crust on Yellow
          IncSearch = { fg = "#181926", bg = "#8AADF4" }, -- Crust on Blue
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
