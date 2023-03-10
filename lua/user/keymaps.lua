local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Tabs and spaces
keymap("n", "<Leader>w",
  [[:<C-u>lua require("user.functions").set_tab_width(vim.v.count)<CR>]], opts)
keymap("n", "<Leader>s",
  [[:<C-u>lua require("user.functions").use_spaces()<CR>]], opts)
keymap("n", "<Leader>t",
  [[:<C-u>lua require("user.functions").use_tabs()<CR>]], opts)
-- Clear search highlight
keymap("n", "<Leader>l", ":nohlsearch<CR>", opts)
-- Move up/down by visual lines
vim.cmd [[nnoremap <expr> j (v:count == 0 ? 'g<down>' : '<down>')]]
vim.cmd [[vnoremap <expr> j (v:count == 0 ? 'g<down>' : '<down>')]]
vim.cmd [[nnoremap <expr> k (v:count == 0 ? 'g<up>' : '<up>')]]
vim.cmd [[vnoremap <expr> k (v:count == 0 ? 'g<up>' : '<up>')]]
-- Delete buffer
keymap("n", "<Leader>c", ":Bdelete<CR>", opts)

-- Insert --
-- Emacs forwards/backwards
keymap("i", "<C-f>", "<Right>", opts)
keymap("i", "<C-b>", "<Left>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("n", "<Leader>k", ":ToggleTerm<CR>", term_opts)
keymap("t", "<Leader>k", "<C-\\><C-n>:ToggleTerm<CR>", term_opts)

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<Leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- Nvim Tree --
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Git Signs --
keymap("n", "<Leader>d", ":Gitsigns preview_hunk<CR>", opts)
