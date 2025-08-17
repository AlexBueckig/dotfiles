-- keymap
--------------------------------------------------------------------------------
local map = vim.keymap.set

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- delete single character without copying into register
map("n", "x", '"_x', opts)

-- save file
map("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
map("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

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

-- Navigating buffers
map("n", "<leader>bb", "<C-^>", { desc = "Switch to alternate buffer" })
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" })

-- Ctrl-L redraws the screen by default. Now it will also toggle search highlighting.
map("n", "<C-l>", ":set hlsearch!<cr><C-l>", { desc = "Toggle search highlighting" })

-- Diagnostic keymaps
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- formatting
map({ "n", "x" }, "<leader>fm", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "format document" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- window management
map("n", "<leader>v", "<C-w>v", opts) -- split window vertically
map("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
map("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
map("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep last yanked when pasting
map("v", "p", '"_dP', opts)
