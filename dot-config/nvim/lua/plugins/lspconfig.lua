local plugin = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			-- LSPs
			-- "pyright",
			"basedpyright",
			"eslint",
			"html",
			-- "ty",
			"lua_ls",
			"bashls",
			"vtsls",
			"jsonls",
			"cssls",
			"css_variables",
			"tailwindcss",
			"marksman",
			"djls",
			"djlsp",
			-- Linting / Formatting
			"stylua",
			"ruff",
			"prettierd",
			"biome",
			"black",
		},
	},
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			{
				"neovim/nvim-lspconfig",
				dependencies = {
					"saghen/blink.cmp",
				},
				config = function()
					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
						callback = function(ev)
							-- Buffer local mappings.
							-- See `:help vim.lsp.*` for documentation on any of the below functions
							local opts = { buffer = ev.buf, silent = true }

							-- set keybinds
							opts.desc = "Show LSP references"
							vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

							opts.desc = "Go to declaration"
							vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

							opts.desc = "Show LSP definition"
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

							opts.desc = "Show LSP implementations"
							vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

							opts.desc = "Show LSP type definitions"
							vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

							opts.desc = "See available code actions"
							vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

							opts.desc = "Smart rename"
							vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

							opts.desc = "Show buffer diagnostics"
							vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

							opts.desc = "Show line diagnostics"
							vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

							opts.desc = "Go to previous diagnostic"
							vim.keymap.set("n", "[d", function()
								vim.diagnostic.jump({ count = -1, float = true })
							end, opts) --
							--
							opts.desc = "Go to next diagnostic"
							vim.keymap.set("n", "]d", function()
								vim.diagnostic.jump({ count = 1, float = true })
							end, opts)

							opts.desc = "Show documentation for what is under cursor"
							vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

							opts.desc = "Show signature help"
							vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
						end,
					})

					-- toggle for virtual text
					vim.keymap.set("n", "<leader>lx", function()
						local current = vim.diagnostic.config().virtual_text
						vim.diagnostic.config({ virtual_text = not current })
					end, { desc = "Toggle LSP virtual text" })

					-- NOTE: Setup servers
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					-- blink cmp
					capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

					-- Global LSP settings (applied to all servers)
					vim.lsp.config("*", {
						capabilities = capabilities,
					})

					vim.diagnostic.config({
						underline = { severity = vim.diagnostic.severity.ERROR },
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = " ",
								[vim.diagnostic.severity.WARN] = " ",
								[vim.diagnostic.severity.HINT] = "󰠠 ",
								[vim.diagnostic.severity.INFO] = " ",
							},
						},
						virtual_text = {
							current_line = false,
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

					vim.api.nvim_create_autocmd("LspAttach", {
						group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client == nil then
								return
							end
							if client.name == "ruff" then
								-- Disable hover in favor of Pyright
								client.server_capabilities.hoverProvider = false
							end
						end,
						desc = "LSP: Disable hover capability from Ruff",
					})
				end,
			},
		},
	},
}

return plugin
