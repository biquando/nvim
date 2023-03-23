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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Aesthetic
  use { "dracula/vim", as = "dracula" }
  -- use { "ntpeters/vim-better-whitespace", config = function() vim.g.better_whitespace_ctermcolor = "" end }

  -- Editing
  -- use "rstacruz/vim-closer"
  use "windwp/nvim-autopairs"
  use "tpope/vim-surround"
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use { "NMAC427/guess-indent.nvim", config = function() require("guess-indent").setup() end }

  -- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim Tree
  use { 'kyazdani42/nvim-web-devicons', config = function() require("nvim-web-devicons").setup() end }
  use 'kyazdani42/nvim-tree.lua'

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- Whichkey
  use { "folke/which-key.nvim", config = function() require("which-key").setup() end }

  -- Misc
  use "rust-lang/rust.vim"
  use { "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }
  use { "lewis6991/impatient.nvim", config = function() require("impatient") end }
  use "ARM9/arm-syntax-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
