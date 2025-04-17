return {
	{
		"glepnir/oceanic-material",
		lazy = false,
		priority = 1000,
		config = function()
			local ui = vim.g
			ui.oceanic_material_allow_italic = 1
			ui.oceanic_material_allow_underline = 1
			ui.oceanic_material_transparent_background = 1
			ui.oceanic_material_background = "ocean"
			ui.oceanic_material_allow_undercurl = 1
			ui.oceanic_material_allow_bold = 1
		end,
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false,
		priority = 1000,
		options = {
			style = "dark",
			transparent = true,
			enable_italics = true,
			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				variables = {},
				string = { italic = true },
				underline = true,
				undercurl = true,
			},
		},
		config = function()
			require("NeoSolarized").setup()
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 1,
				italics = true,
				ui_contrast = "high",
				diagnostic_virtual_text = "colored",
			})
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark",
			transparent = true,
			enable_italics = true,
			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				variables = {},
				string = { italic = true },
				underline = true,
				undercurl = true,
			},
		},
		config = function()
			require("solarized-osaka").setup()
		end,
	},
	{
		"HoNamDuong/hybrid.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("hybrid").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					folds = true,
				},
				strikethrough = true,
				inverse = true,
				transparent = true,
			})
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("kanagawa-paper").setup({
				undercurl = true,
				transparent = true,
				commentStyle = { italic = true },
				functionStyle = { italic = true },
				color_offset = {
					canvas = { brightness = 1, saturation = 1 },
				},
			})
			vim.cmd([[colorscheme kanagawa-paper-canvas]])
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				bold_keywords = false,
				italic_comments = true,
				transparent = {
					bg = false,
					float = false,
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				styles = {
					transparency = true,
					italic = true,
				},
				highlight_groups = {
					NormalFloat = { bg = "base", blend = 0 }, -- Set background for floating windows
					Pmenu = { bg = "base" },
					PmenuSel = { bg = "overlay", fg = "love" },
					PmenuBorder = { bg = "base", fg = "highlight_high" },
					TelescopeBorder = { fg = "highlight_high", bg = "base" },
					TelescopeNormal = { bg = "base" },
					TelescopePromptNormal = { bg = "base" },
					TelescopeResultsNormal = { fg = "subtle", bg = "base" },
					TelescopeSelection = { fg = "text", bg = "base" },
				},
			})
		end,
	},
	{
		"talha-akram/noctis.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = true,
			styles = { sidebars = "transparent" },
		},

		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				theme = "dragon", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
}
