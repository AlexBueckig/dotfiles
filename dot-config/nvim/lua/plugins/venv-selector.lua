local plugin = {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
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
		options = {}, -- if you add plugin options, they go here.
	},
}

return plugin
