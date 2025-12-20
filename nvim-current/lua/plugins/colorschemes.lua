return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --  	vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
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
  {
    "vague-theme/vague.nvim",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
        transparent = true
      })
      vim.cmd("colorscheme vague")
    end
  },
}
