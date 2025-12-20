---@diagnostic disable: unused-local
-- return {
-- 	{
-- 		"nvim-telescope/telescope-ui-select.nvim",
-- 	},
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.5",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			require("telescope").setup({
-- 				extensions = {
-- 					["ui-select"] = {
-- 						require("telescope.themes").get_dropdown({}),
-- 					},
-- 				},
-- 			})
-- 			local builtin = require("telescope.builtin")
-- 			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- 			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- 			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
--
-- 			require("telescope").load_extension("ui-select")
-- 		end,
-- 	},
-- }
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      local telescope = require("telescope")
      local default_color = "catppuccin"
      telescope.setup({
        defaults = {
          preview = false,
          color_devicons = true,
          sorting_strategy = "ascending",
          path_displays = { "smart" },
          layout_config = {
            prompt_position = "bottom",
          }
        }
      })
      telescope.load_extension("ui-select")
    end
  },

}
