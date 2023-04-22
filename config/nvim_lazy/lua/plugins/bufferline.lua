vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
        },
    },
  },
}
