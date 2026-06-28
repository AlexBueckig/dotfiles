local plugin = {
	"Juksuu/worktrees.nvim",
	opts = {
		swap_current_buffer = false,
		hooks = {
			on_switch = function(from, to)
				local Path = require("plenary.path")
				local any_exist = false
				for win in vim.iter(vim.api.nvim_list_tabpages()):map(vim.api.nvim_tabpage_list_wins):flatten() do
					local bufnr = vim.api.nvim_win_get_buf(win)
					local buf_path = Path:new(vim.api.nvim_buf_get_name(bufnr))
					local rel_path = buf_path:make_relative(from)
					local path_in_new_cwd = Path:new(to .. "/" .. rel_path)
					if path_in_new_cwd:exists() then
						any_exist = true
						vim.schedule(function()
							local buf_in_new_cwd = vim.fn.bufnr(path_in_new_cwd:absolute(), true)
							vim.api.nvim_win_set_buf(win, buf_in_new_cwd)
							vim.api.nvim_buf_delete(bufnr)
						end)
					else
						vim.api.nvim_win_close(win, true)
					end
					if not any_exist then
						local root = vim.fn.bufnr(to)
						vim.api.nvim_set_current_buf(root)
					end
				end
			end,
		},
	},
}

return plugin
