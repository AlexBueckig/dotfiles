-- Standalone plugins with less than 10 lines of config go here
local plugins = {
  {
    -- tmux & split window navigation
    'christoomey/vim-tmux-navigator',
  },
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
    ft = {
      'html',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
    config = true,
  },
  {
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = true,
  },
  {
    'mbbill/undotree',
  },
  {
    'tpope/vim-surround',
  },
}

return plugins
