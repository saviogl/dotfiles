return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
          init_options = {
            formatter = "auto",
          },
        },
      },
    },
  },
}