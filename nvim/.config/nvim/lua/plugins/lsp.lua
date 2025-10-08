return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Bash
      vim.lsp.config.bashls = {
        capabilities = capabilities,
      }

      -- Python
      vim.lsp.config.pyright = {
        capabilities = capabilities,
      }

      -- Lua
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      }

      -- Autostart LSPs when opening matching filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "sh",
        callback = function(args)
          vim.lsp.start(vim.lsp.config.bashls, { bufnr = args.buf })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(args)
          vim.lsp.start(vim.lsp.config.pyright, { bufnr = args.buf })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function(args)
          vim.lsp.start(vim.lsp.config.lua_ls, { bufnr = args.buf })
        end,
      })
    end,
  },
}


