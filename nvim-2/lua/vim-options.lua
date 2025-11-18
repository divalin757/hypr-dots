vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.o.termguicolors = true
vim.o.undofile = true

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
--- vim.keymap.set('i', 'jj', '<ESC>')


vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":lua Snacks.explorer.open()<CR>")
vim.wo.number = true
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.undofile = true
vim.o.swapfile = false

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		local mode = vim.api.nvim_get_mode().mode
-- 		local filetype = vim.bo.filetype
-- 		if vim.bo.modified == true and mode == "n" and filetype ~= "oil" then
-- 			vim.cmd("lua vim.lsp.buf.format()")
-- 		else
-- 		end
-- 	end,
-- })
