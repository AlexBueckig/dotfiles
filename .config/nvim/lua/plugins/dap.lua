local plugins = {
  {
    'mfussenegger/nvim-dap',
    config = function()
      -- keybinds
      vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>', { desc = '[D]ebug [B]reakpoint' })
      vim.keymap.set('n', '<leader>dc', '<cmd> DapContinue <CR>', { desc = '[D]ebug [C]ontinue' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      -- dap.listeners.after.event_terminated['dapui_config'] = function()
      --   dapui.close()
      -- end
      dap.listeners.after.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function(_, opts)
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
      configs = require('dap').configurations.python
      table.insert(configs, {
        type = 'python',
        request = 'launch',
        name = 'Django with arguments',
        program = vim.loop.cwd() .. '/manage.py',
        args = function()
          -- 'runserver', '--noreload',
          local args_string = vim.fn.input 'Arguments: '
          return vim.split(args_string, ' ')
        end,
        justMyCode = true,
        django = true,
        console = 'integratedTerminal',
      })
    end,
  },
}

return plugins
