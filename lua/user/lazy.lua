local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- SECTION: Simple plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  { 'numToStr/Comment.nvim', config = true },
  { 'folke/which-key.nvim', config = true },
  'lukas-reineke/indent-blankline.nvim',
  'tpope/vim-surround',
  { 'NMAC427/guess-indent.nvim', config = true },  -- alternative: vim-sleuth

  -- SECTION: LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- SECTION: Linting
  {
    'mfussenegger/nvim-lint',
    -- See plugins/lint.lua
  },

  -- SECTION: Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  -- SECTION: Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', 'gh', require('gitsigns').prev_hunk, {
          buffer = bufnr,
          desc = '[G]o to Previous [h]unk'
        })
        vim.keymap.set('n', 'gH', require('gitsigns').next_hunk, {
          buffer = bufnr,
          desc = '[G]o to Next [H]unk'
        })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, {
          buffer = bufnr,
          desc = '[P]review [H]unk'
        })
      end,
    },
  },

  -- SECTION: Colorscheme
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = require('user.colors').set_colors,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },

  -- SECTION: Lualine
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          function()
            if vim.o.expandtab then
              return 'SP ' .. vim.o.tabstop
            else
              return 'TS ' .. vim.o.tabstop
            end
          end,
          'filetype',
        },
      },
    },
  },

  -- SECTION: Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- SECTION: Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- SECTION: Todo-comments
  {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup({
        keywords = {
          SECTION = { icon = '#', color = 'hint' }
        }
      })
    end,
  },

  -- SECTION: Toggleterm
  {
    'akinsho/toggleterm.nvim',
    -- See plugins/toggleterm.lua
  },

  -- SECTION: Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },

  -- SECTION: NERDTree
  {
    'preservim/nerdtree',
    config = function()
      vim.g.NERDTreeShowHidden=1
    end,
  },

  -- SECTION: Harpoon
  {
    'ThePrimeagen/harpoon',
    -- See plugins/harpoon.lua
  },
}, {})
