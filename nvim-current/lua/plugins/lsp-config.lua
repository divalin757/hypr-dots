return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- show an icon inline
			  spacing = 4,
		  },
		  signs = true,
		  underline = true,
		  update_in_insert = false, -- optional, don't update while typing
		  severity_sort = true,
	  })

	  vim.lsp.config("lua_ls", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["lua_ls"] = {},
		  },
	  })
	  vim.lsp.config("pyright", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["pyright"] = {},
		  },
	  })
	  vim.lsp.config("bash_ls", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["bash_ls"] = {},
		  },
	  })
	  vim.lsp.config("clangd", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["clangd"] = {},
		  },
	  })

	  vim.lsp.config("zls", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["zls"] = {},
		  },
	  })



	  vim.lsp.config("rust_analyzer", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["rust-analyzer"] = {},
		  },
	  })
	  vim.lsp.config("taplo", {
		  -- server-specific settings. see `:help lsp-quickstart`
		  settings = {
			  ["taplo"] = {},
		  },
	  })

	  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  end,  },
}

