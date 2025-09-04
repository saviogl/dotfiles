return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.enabled = function()
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
        if buftype == "prompt" then
          return false
        end

        local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        if filetype == "markdown" then
          return false
        end

        return true
      end

      opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
        autocomplete = false,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          cmp.setup.buffer({
            enabled = false,
            completion = {
              autocomplete = false,
            },
          })
        end,
      })

      return opts
    end,
  },
}

