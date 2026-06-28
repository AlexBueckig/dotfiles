local plugin = {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	ft = "python", -- Load when opening Python files
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
	},
	opts = { -- this can be an empty lua table - just showing below for clarity.
		search = {
			-- my_projects = {
			-- 	command = "fd --no-ignore --type symlink --hidden --full-path '\\.?venv.*python$' ~/Code",
			-- },
		}, -- if you add your own searches, they go here.
		options = {
			picker = "snacks",
		}, -- if you add plugin options, they go here.
	},
}

return plugin
