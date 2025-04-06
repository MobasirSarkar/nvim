return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	cmd = "Telescope",
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-p>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			--[[ extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				fzf = {},
			}, ]]
			pickers = {
				find_files = {
					theme = "ivy",
				},
				git_files = {
					theme = "ivy",
				},
			},
		})
		require("telescope").load_extension("ui-select")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>o", builtin.find_files, {})
		vim.keymap.set("n", "<C-g>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>mg", function()
			local live_multigrep = require("mobasir.config.telescope.multigrep").live_multigrep
			live_multigrep()
		end)
		vim.keymap.set("n", "<leader>ww", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
