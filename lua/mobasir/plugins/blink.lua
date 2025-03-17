return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				menu = {
					enabled = true,
					scrollbar = false,
					winblend = 0,
					min_width = 25,
					max_height = 15,
					draw = {
						columns = { { "label", "label_description", gap = 2 } },
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
