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
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

--Glow - markdow previewer
keymap("n", "<leader>gl", "<cmd>Glow<CR>", opts)

-- ToggleTerm
keymap("n", "<leader>tig", "<cmd>lua _TIG_TOGGLE()<CR>", opts)
keymap("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)

-- Bufferline
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

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
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)

-- Null-ls
keymap("n", "<leader>f", "<cmd>Format<cr>", opts)
