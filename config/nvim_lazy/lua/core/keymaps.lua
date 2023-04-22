vim.g.mapleader = " "

local keymap = vim.keymap

-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 窗口拆分
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平拆分
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直拆分

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- bufferline切换
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")
