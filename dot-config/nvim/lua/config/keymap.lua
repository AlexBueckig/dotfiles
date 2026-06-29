-- keymap
--------------------------------------------------------------------------------

vim.g.mapleader = " "

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
-- vim.keymap.set("v", "p", '"_dP', { desc = "Keep last yanked when pastin" })

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "general clear highlights", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
-- Move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "move lines down in normal mode" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "move lines up in normal mode" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- native undotree
-- using mbbill/undotree for now
-- vim.keymap.set("n", "<leader>u", function()
-- 	vim.cmd.packadd("nvim.undotree")
-- 	require("undotree").open()
-- end, { desc = "Toggle Builtin Undotree" })

-- treesitter textobjects keymaps
-- select
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Select around function" })
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner function" })
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Select around class" })
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner class" })
vim.keymap.set({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select outer parameter" })
vim.keymap.set({ "x", "o" }, "ia", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inner parameter" })

-- swap
vim.keymap.set("n", "<leader>a", function()
	require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end, { desc = "Swap parameter right" })
vim.keymap.set("n", "<leader>A", function()
	require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
end, { desc = "Swap parameter left" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy package manager" })

vim.keymap.set(
	{ "n", "v" },
	"<Space>",
	"<Nop>",
	{ desc = "Disable the spacebar key's default behavior in Normal and Visual modes", silent = true }
)

vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ desc = "Move cursor through wrapped lines", expr = true, silent = true }
)
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ desc = "Move cursor through wrapped lines", expr = true, silent = true }
)

vim.keymap.set("n", "x", '"_x', { desc = "Delete single character without copying into register" })
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", { desc = "Save file without auto-formatting" })

-- Navigation in insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })

-- Navigating buffers
vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next Buffer" })

vim.keymap.set("n", "<leader>fd", "<CMD>filetype detect<CR>", { desc = "[F]iletype [D]etect" })

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Navigate split up" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Navigate split down" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Navigate split left" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Navigate split right" })

-- window management
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal width and height" })
vim.keymap.set("n", "<leader>xs", ":close<CR>", { desc = "Close current split window" })

-- ################################################################################################
-- Diagnostic keymaps
-- map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- filetype detect

-- commenting
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
