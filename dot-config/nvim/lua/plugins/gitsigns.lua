return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
		on_attach = function(buffer)
			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end, { noremap = true, silent = true, desc = "Jump to prev hunk" })
			vim.keymap.set("n", "<leader>rh", function()
				require("gitsigns").reset_hunk()
			end, { noremap = true, silent = true, desc = "Reset hunk" })

			vim.keymap.set("n", "<leader>ph", function()
				require("gitsigns").preview_hunk()
			end, { noremap = true, silent = true, desc = "Preview hunk" })
			-- vim.keymap.set("n", "<leader>gl", function()
			-- 	package.loaded.gitsigns.blame_line()
			-- end, { noremap = true, silent = true, desc = "Blame line" })
			vim.keymap.set("n", "<leader>td", function()
				require("gitsigns").toggle_deleted()
			end, { noremap = true, silent = true, desc = "Toggle deleted" })
		end,
	},
}
