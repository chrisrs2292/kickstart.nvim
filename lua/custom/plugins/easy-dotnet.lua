return {
  'GustavEikaas/easy-dotnet.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local dotnet = require 'easy-dotnet'
    dotnet.setup {
      picker = 'telescope',
      lsp = {
        enabled = true,
        roslynator_enabled = true,
      },
      test_runner = {
        viewmode = 'float',
      },
    }

    vim.keymap.set('n', '<leader>dr', function() dotnet.run() end, { desc = '[D]otnet [R]un' })
    vim.keymap.set('n', '<leader>dt', function() dotnet.test_solution() end, { desc = '[D]otnet [T]est' })
    vim.keymap.set('n', '<leader>ds', function() dotnet.secrets() end, { desc = '[D]otnet [S]ecrets' })
  end,
}
