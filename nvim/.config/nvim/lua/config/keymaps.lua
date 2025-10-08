local builtin = require('telescope.builtin')

--telescope stuff
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Telescope themes' })

--lsp bindss
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = 'Go to references'})
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = 'code actions' })

--oil nvim  bind 
vim.keymap.set("n", "<leader>o", ':Oil<CR>', { desc = 'Toggle Oil nvim' })

--file tree bind 
vim.keymap.set("n", "<leader>se", ':lua Snacks.explorer()<CR>', { desc = 'Toggle explorer' })
vim.keymap.set("n", "<leader>sf", ':lua Snacks.picker.files()<CR>', { desc = 'Toggle Picker' })

--binds for lazy optreations
vim.keymap.set("n", "<leader>lo", ':Lazy<CR>', { desc = 'Open lazy' })
vim.keymap.set("n", "<leader>lc", ':Lazy clean<CR>', { desc = 'lazy clean' })
vim.keymap.set("n", "<leader>lu", ':Lazy update<CR>', { desc = 'lazy update' })
vim.keymap.set("n", "<leader>ls", ':Lazy sync<CR>', { desc = 'lazy sync' })
