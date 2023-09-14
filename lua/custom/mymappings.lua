local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local vkey = vim.keymap.set

-- Setup keys 
-- check using :letmapleader or :let maplocalleader
-- -> need to put inside plugins mapping also to make it work on those mapping
vim.g.maplocalleader = ","
-- HANDLE TAB TIPS in lua : https://github.com/nanotee/nvim-lua-guide#tips-4

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Resize with ESC keys - up down use for auto cmpl
vkey({"n" }, "<Up>", ":resize -2<CR>", opts)
vkey({"n" }, "<Down>", ":resize +2<CR>", opts)
vkey({"n"}, "<Left>", "<cmd>vertical resize -2<CR>", opts)
vkey({"n"}, "<Right>", "<cmd>vertical resize +2<CR>", opts)

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

-- ========================
-- TO BE MIGRATED ============
-- =====================
--
-- Menu navigation
-- Set the variable g:copilot_no_tab_map to true.
vim.g.copilot_no_tab_map = true
-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true
-- same output as using vim but not able to complete ?
-- keymap('i', '<C-/>', 'copilot#Accept("\\<CR>")', {expr=true, silent=true, script=true, desc="copilot Accept" })
-- keymap('i', '<C-J>', 'copilot#Accept("\\<CR>")', {expr=true, silent=true, script=true, desc="Copilot Accept"})

-- " THE EXISTING Key bindings cannot be remap again"
-- C-J, C-E cannot be used to map again
-- vim cmd works but vkey will have some weird char after hit enter / accept 

vim.cmd([[
  " imap <silent><expr> <C-J> copilot#Accept("\<CR>")
  " imap <silent><expr> <C-e> copilot#Accept("\<CR>")
  " imap <silent><expr> <C-E> copilot#Accept("\<CR>")
  imap <silent><expr> <C-o> copilot#Accept("\<CR>") 
  " imap <silent><expr> <C-/> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

-- vkey("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- vkey("i", "<C-o>", 'copilot#Accept()', { noremap = true, silent = true, expr = true })
-- keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
-- keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

