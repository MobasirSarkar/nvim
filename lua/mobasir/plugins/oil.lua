return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	--dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			keymaps = {
				["<CR>"] = "actions.select",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = "actions.refresh",
				["/"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["h."] = { "actions.toggle_hidden", mode = "n" },
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
