local config = {
	settings = {
		basedpyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
			disableLanguageServices = false,
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { "*" },
				-- diagnosticMode = "off", -- Only analyze open files
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true, -- whether pyright
			},
		},
	},
}

return config
