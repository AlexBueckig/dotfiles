local config = {
	settings = {
		-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
		workingDirectories = { mode = "auto" },
		experimental = {
			-- allows to use flat config format
			useFlatConfig = true,
		},
	},
}

return config
