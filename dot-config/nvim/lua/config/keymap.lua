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

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Navigating buffers
map("n", "<leader>bb", "<C-^>", { desc = "Switch to alternate buffer" })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Previous buffer" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next Buffer" })

-- Ctrl-L redraws the screen by default. Now it will also toggle search highlighting.
map("n", "<C-l>", ":set hlsearch!<cr><C-l>", { desc = "Toggle search highlighting" })

-- Diagnostic keymaps
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

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

-- filetype detect
map("n", "<leader>fd", "<CMD>filetype detect<CR>", { desc = "[F]iletype [D]etect" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
