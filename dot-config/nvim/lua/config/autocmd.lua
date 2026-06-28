-- autocmd
--------------------------------------------------------------------------------
-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- enable treesitter
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"css",
		"csv",
		"dockerfile",
		"go",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"scss",
		"tsx",
		"typescript",
		"typescriptreact",
		"xml",
		"yaml",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
