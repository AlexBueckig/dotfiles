return {
	"stevearc/conform.nvim",
	-- formatting
    loading = "VeryLazy",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_format = "never" })
			end,
			mode = { "n", "x" },
			desc = "[F]or[m]at buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = {
				-- To fix auto-fixable lint errors.
				"ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
			scss = { "prettierd", "prettier", "biome-check", stop_after_first = true },
			css = { "prettierd", "prettier", "biome-check",stop_after_first = true },
			javascript = { "prettierd", "prettier", "biome-check",stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", "biome-check",stop_after_first = true },
			typescript = { "prettierd", "prettier", "biome-check",stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", "biome-check",stop_after_first = true },
			html = { "html_beautify", "prettierd", "prettier", "biome-check",stop_after_first = true },
            htmldjango = { "djlint" },
			--javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
			--javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
			--typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
			--typescriptreact = { "biome", "biome-organize-imports", "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	},
}
