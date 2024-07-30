require("config.lazy")

vim.cmd("colorscheme nord")

vim.opt.fenc = "utf-8"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "onemore"
vim.opt.smartindent = true
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.wildmode = "list:longest"
vim.opt.list = true
vim.opt.listchars = "tab:▸-"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
