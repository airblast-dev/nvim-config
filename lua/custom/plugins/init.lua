-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
      vim.keymap.set('n', '<leader>e', function()
        vim.cmd 'NvimTreeToggle .'
      end, { desc = 'Toggle file tree in current directory.' })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>g', function()
        vim.cmd 'LazyGit'
      end, { desc = 'Toggle LazyGit.' })
    end,
  },
  {
    'numToStr/FTerm.nvim',
    config = function()
      require 'FTerm'
      vim.keymap.set('n', '<leader>t', function()
        require('FTerm').toggle()
      end, { desc = 'Toggle FTerm.' })
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup {
        lsp_cfg = true,
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
  },
}
