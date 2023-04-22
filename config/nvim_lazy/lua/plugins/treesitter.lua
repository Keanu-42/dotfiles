require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "haskell", "html", "json", "lua", "markdown", "markdown_inline", "org", "vim" },
  highlight = {enable = true},
  indent = {enable = true},

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
