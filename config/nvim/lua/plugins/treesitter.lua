require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "haskell", "help", "html", "json", "lua", "markdown", "org", "vim" },
  highlight = {enable = true},
  indent = {enable = true},

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
