return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
     	vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("tokyonight-moon")
    -- end,
    opts = {},
  },
  {
    "EdenEast/nightfox.nvim",
    -- config = function()
    --   vim.cmd.colorscheme("nightfox")
    -- end
  },
}
