-- Modes
--    normal mode = "n",
--    insert mode = "i",
--    visual mode = "v",
--    visual block mode = "x",
--    term mode = "t",
--    command mode = "c",

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE
-- File explorer
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Copy path to File
keymap("n", "<leader>cp", ":let @+ = expand('%:p')<CR>", opts)
 
-- INSERT MODE
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- VISUAL MODE
keymap("v", "c", "y", opts) -- copy
keymap("v", "x", "d", opts) -- cut
keymap("v", "v", "p", opts) -- past

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- VISUAL BLOCK
keymap("x", "c", "y", opts) -- copy
keymap("x", "x", "d", opts) -- cut 
keymap("x", "v", "p", opts) -- past

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- TERMINAL
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-F>", "<cmd>Telescope grep_string<cr>", opts)
-- keymap("n", "<c-F>", "<cmd>Telescope live_grep<cr>", opts)
