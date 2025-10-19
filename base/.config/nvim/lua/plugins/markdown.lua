return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Disable for markdown, but allow buffer-local override via vim.b.blink_cmp_enabled
    opts.enabled = function()
      return vim.b.blink_cmp_enabled
        or (vim.b.blink_cmp_enabled == nil and vim.bo.filetype ~= "markdown" and vim.bo.buftype ~= "prompt")
    end

    -- User commands for manual control
    vim.api.nvim_create_user_command("CmpDisable", function()
      vim.b.blink_cmp_enabled = false
    end, { desc = "Disable completion in current buffer" })

    vim.api.nvim_create_user_command("CmpEnable", function()
      vim.b.blink_cmp_enabled = true
    end, { desc = "Enable completion in current buffer" })

    vim.api.nvim_create_user_command("CmpToggle", function()
      vim.b.blink_cmp_enabled = not (vim.b.blink_cmp_enabled or vim.bo.filetype ~= "markdown")
    end, { desc = "Toggle completion in current buffer" })

    return opts
  end,
}

