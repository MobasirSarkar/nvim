return {
	"junnplus/lsp-setup.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim", -- optional
		"williamboman/mason-lspconfig.nvim", -- optional
		"Saghen/blink.cmp",
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		require("lsp-setup").setup({
			default_mappings = true,
			on_attach = function(client, bufnr)
				require("lsp-setup.utils").format_on_save(client)
			end,
			inlay_hints = {
				enabled = true,
				highlight = "Comment",
			},
			--capabilities = vim.lsp.protocol.make_client_capabilities(),
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			servers = {
				pylsp = {},
				gopls = {
					settings = {
						gopls = {
							hints = {},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							diagonistic = {
								globals = { "vim" },
								unusedLocalVariable = true,
								unusedFunction = true,
							},
							hint = {
								enable = false,
								arrayIndex = "Auto",
								await = true,
								paramName = "All",
								paramType = true,
								semicolon = "SameLine",
								setType = false,
							},
						},
					},
				},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								loadOutDirsFromCheck = true,
							},
							inlayHints = {
								bindingModeHints = {
									enable = false,
								},
								chainingHints = {
									enable = true,
								},
								closingBraceHints = {
									enable = true,
									minLines = 25,
								},
								closureReturnTypeHints = {
									enable = "never",
								},
								lifetimeElisionHints = {
									enable = "never",
									useParameterNames = false,
								},
								maxLength = 25,
								parameterHints = {
									enable = true,
								},
								reborrowHints = {
									enable = "never",
								},
								renderColons = true,
								typeHints = {
									enable = true,
									hideClosureInitialization = false,
									hideNamedConstructor = false,
								},
							},
						},
					},
				},
				zls = {
					settings = {
						zls = {
							enable_inlay_hints = true,
							inlay_hints_show_builtin = true,
							inlay_hints_exclude_single_argument = true,
							inlay_hints_hide_redundant_param_names = false,
							inlay_hints_hide_redundant_param_names_last_token = false,
						},
					},
				},
			},
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})
	end,
}
