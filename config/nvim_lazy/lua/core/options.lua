local opt = vim.opt
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

opt.cursorline = true

-- 启用鼠标
-- opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 新窗口默认设置
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme everforest]]
vim.cmd[[colorscheme OceanicNext]]
