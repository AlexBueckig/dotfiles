-- Format on save and linters
local plugin = {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- list of formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'checkmake',
        'prettierd', -- ts/js formatter
        'stylua',    -- lua formatter
        'shfmt',
        'djlint',
        'mypy',
        'ruff',
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    }

    local sources = {
      diagnostics.checkmake,
      diagnostics.djlint,
      -- diagnostics.mypy.with {
      --   extra_args = function()
      --     local virtual = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX' or '/usr'
      --     return { '--python-executable', virtual .. '/bin/python' }
      --   end,
      -- },
      formatting.prettierd,
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.djlint,
      require 'none-ls.formatting.ruff',
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}

return plugin
