return {
	"Saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "1.*",
	--@module 'blink.cmp'
	--@type blink.cmp.config
	opts = {
		keymap = { preset = "default" },
		signature = { enabled = true },
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1000,
			},
			menu = {
				enabled = true,
				scrollbar = false,
				winblend = 0,
				min_width = 25,
				max_height = 15,
				draw = {
					padding = { 3, 3 },
					columns = { { "label", "label_description", gap = 2 } },
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "snippets", "dadbod", "buffer" },
		},
		providers = {
			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},
	opts_extend = { "sources.default" },
}
