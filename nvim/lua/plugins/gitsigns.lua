-- Adds git related signs to the gutter, as well as utilities for managing changes
local plugin = {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }

    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        require('gitsigns').next_hunk()
      end)
      return '<Ignore>'
    end, { noremap = true, silent = true, desc = 'Jump to next hunk' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        require('gitsigns').prev_hunk()
      end)
      return '<Ignore>'
    end, { noremap = true, silent = true, desc = 'Jump to prev hunk' })
    vim.keymap.set('n', '<leader>rh', function()
      require('gitsigns').reset_hunk()
    end, { noremap = true, silent = true, desc = 'Reset hunk' })

    vim.keymap.set('n', '<leader>ph', function()
      require('gitsigns').preview_hunk()
    end, { noremap = true, silent = true, desc = 'Preview hunk' })
    vim.keymap.set('n', '<leader>gl', function()
      package.loaded.gitsigns.blame_line()
    end, { noremap = true, silent = true, desc = 'Blame line' })
    vim.keymap.set('n', '<leader>td', function()
      require('gitsigns').toggle_deleted()
    end, { noremap = true, silent = true, desc = 'Toggle deleted' })
  end,
}

return plugin
