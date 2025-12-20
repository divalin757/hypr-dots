vim.g.maplocalleader = " "
return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.export"] = {},
				["core.integrations.telescope"] = {},
                ["core.summary"] = {},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
					},
				},
                ["core.esupports.hop"] = { config = {} },
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
			},

		})
		vim.wo.foldlevel = 99
		-- vim.wo.conceallevel = 2
	end,
}
