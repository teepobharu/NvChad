local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local vkey = vim.keymap.set

-- Setup keys 
-- check using :letmapleader or :let maplocalleader
-- -> need to put inside plugins mapping also to make it work on those mapping
vim.g.maplocalleader = ","

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Tmux navigation
-- keymap("nvt", "<C-l>", "<cmd>TmuxNavigateLeft<cr>", opts)
-- keymap("nv", "<C-j>", "<cmd>TmuxNavigateUp<cr>")
-- keymap("n", "<C-k>", "<cmd>TmuxNavigateDown<cr>")
-- keymap("t", "<C-k>", "<cmd>TmuxNavigateDown<cr>")
-- keymap("t", "<C-j>", "<cmd>TmuxNavigateDown<cr>")

vkey({"n" ,"t" ,"v"}, "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vkey({"n" ,"t" ,"v"}, "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vkey({"n" ,"t" ,"v"}, "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vkey({"n" ,"t" ,"v"}, "<C-l>", "<cmd>TmuxNavigateRight<cr>")
-- vkey("t", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
-- vkey("t", "<C-j>", "<cmd>TmuxNavigateDown<cr>")

-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )
