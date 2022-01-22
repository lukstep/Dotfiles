local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim"        -- Have packer manage itself
    use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"         -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs"         -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"

    -- Color themes
    use "rafamadriz/neon"
    use "Mofiqul/vscode.nvim"
    use "theniceboy/nvim-deus"
    use "dracula/vim"

    -- Completion plugins
    use "hrsh7th/nvim-cmp"              -- The completion plugin
    use "hrsh7th/cmp-buffer"            -- buffer completions
    use "hrsh7th/cmp-path"              -- path completions
    use "hrsh7th/cmp-cmdline"           -- cmdline completions
    use "hrsh7th/cmp-nvim-lua"          -- neovim lua completions
    use "hrsh7th/cmp-nvim-lsp"          -- neovim lsp completions
    use "saadparwaiz1/cmp_luasnip"      -- snppet completions
    use "lukas-reineke/indent-blankline.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"         -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simply to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

    -- Snippets
    use "L3MON4D3/LuaSnip"              --snippet engine
    use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- GIT
    use "lewis6991/gitsigns.nvim"


    -- IDE
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use 'nvim-lualine/lualine.nvim'
    use "akinsho/toggleterm.nvim"
    use 'goolord/alpha-nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

