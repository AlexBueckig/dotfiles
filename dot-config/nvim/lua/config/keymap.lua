-- keymap
--------------------------------------------------------------------------------
local map = vim.keymap.set

-- Navigation in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Navigate visual lines
map({ "n", "x" }, "j", "gj", { desc = "Navigate down (visual line)" })
map({ "n", "x" }, "k", "gk", { desc = "Navigate up (visual line)" })
map({ "n", "x" }, "<Down>", "gj", { desc = "Navigate down (visual line)" })
map({ "n", "x" }, "<Up>", "gk", { desc = "Navigate up (visual line)" })
map("i", "<Down>", "<C-\\><C-o>gj", { desc = "Navigate down (visual line)" })
map("i", "<Up>", "<C-\\><C-o>gk", { desc = "Navigate up (visual line)" })

-- Move Lines
map({ "n", "x" }, "<M-k>", ":move -2<cr>", { desc = "Move Line Up" })
map({ "n", "x" }, "<M-j>", ":move +1<cr>", { desc = "Move Line Down" })
map("i", "<M-k>", "<C-o>:move -2<cr>", { desc = "Move Line Up" })
map("i", "<M-j>", "<C-o>:move +1<cr>", { desc = "Move Line Down" })

-- Navigating buffers
map("n", "<leader>bb", "<C-^>", { desc = "Switch to alternate buffer" })
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" })

-- Ctrl-L redraws the screen by default. Now it will also toggle search highlighting.
map("n", "<C-l>", ":set hlsearch!<cr><C-l>", { desc = "Toggle search highlighting" })

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- formatting
map({ "n", "x" }, "<leader>fm", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "format document" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
