return {
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					theme = "material",
					icon_enabled = true,
				},
			})
		end,
	},

	-- for float , Add & Remove files
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	-- sidebar indent
	--[[ 	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	}, ]]
	{

		"rcarriga/nvim-notify",
		opts = {
			timeout = 500,
		},
		config = function(_, opts)
			require("notify").setup(vim.tbl_extend("keep", {
				background_colour = "#000000",
			}, opts))
		end,
	},
	-- For notify and messages
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				-- you can enable a preset for easier configuration
				cmdline = {
					view = "cmdline",
				},
				format = {
					search_down = {
						view = "cmdline",
					},
					search_up = {
						view = "cmdline",
					},
				},
				messages = {
					view_history = "messages",
				},
				views = {
					split = {
						enter = true,
					},
				},
			})
			vim.keymap.set("n", "<leader>nl", function()
				require("noice").cmd("last")
			end)

			vim.keymap.set("n", "<leader>nh", function()
				require("noice").cmd("history")
			end)
		end,
	},

	-- Tagging Files
	{
		"b0o/incline.nvim",
		config = function()
			local helpers = require("incline.helpers")
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 1 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					return {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
						guibg = "#44406e",
					}
				end,
			})
		end,
		event = "VeryLazy",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = true,
			})
		end,
	},
}
