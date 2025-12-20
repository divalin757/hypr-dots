vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.o.termguicolors = true
vim.o.undofile = true
vim.opt.laststatus = 3

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>e", ":lua Snacks.explorer.open()<CR>")

vim.keymap.set("n", "g0", "<CMD>Neorg toc<CR>")


vim.wo.number = true
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.swapfile = false

