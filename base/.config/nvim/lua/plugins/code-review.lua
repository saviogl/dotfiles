return {
  "choplin/code-review.nvim",
  opts = {},
  config = function(_, opts)
    require("code-review").setup(opts)

    -- Copy the whole review out and clear it in one step, so the next batch sent
    -- to an agent can never carry comments that were already sent
    vim.keymap.set("n", "<leader>rY", function()
      local cr = require("code-review")
      if #require("code-review.state").get_comments() == 0 then
        vim.notify("No comments to copy", vim.log.levels.WARN)
        return
      end
      cr.copy()
      cr.clear()
    end, { desc = "Copy review to clipboard and clear" })

    -- <C-CR> doesn't work in most terminals, add alternative submit keys
    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeReviewInputEnter",
      callback = function(ev)
        local buf = ev.data.buf
        local funcs = require("code-review").get_input_buffer_functions(buf)

        -- Submit with Enter in normal mode
        vim.keymap.set("n", "<CR>", funcs.submit, { buffer = buf, desc = "Submit comment" })
      end,
    })
  end,
}
