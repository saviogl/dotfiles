return {
  "choplin/code-review.nvim",
  opts = {},
  config = function(_, opts)
    require("code-review").setup(opts)

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
