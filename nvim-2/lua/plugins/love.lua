return {
  -- other plugins ...

  {
    "S1M0N38/love2d.nvim",
    config = function()
      require("love2d").setup({
        love_command = "love", -- path to Love2D executable
        love_args = { "." }, -- run current folder
      })
    end,
  },
}

