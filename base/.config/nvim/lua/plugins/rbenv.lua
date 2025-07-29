return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Ensure rbenv shims are in PATH for Neovim
      local rbenv_root = vim.fn.expand("~/.rbenv")
      local rbenv_shims = rbenv_root .. "/shims"
      local rbenv_bin = rbenv_root .. "/bin"
      
      -- Prepend rbenv paths to PATH if not already present
      local path = vim.env.PATH or ""
      if not path:match(rbenv_shims) then
        vim.env.PATH = rbenv_shims .. ":" .. rbenv_bin .. ":" .. path
      end
    end,
  },
}