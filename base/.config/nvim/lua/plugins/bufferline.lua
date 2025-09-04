return {
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        local ok, integration = pcall(require, "catppuccin.groups.integrations.bufferline")
        if ok and integration then
          local get_highlights = integration.get_theme or integration.get
          if type(get_highlights) == "function" then
            opts.highlights = get_highlights()
          end
        end
      end
    end,
  },
}
