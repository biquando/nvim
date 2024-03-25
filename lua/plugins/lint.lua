local lint_exists, lint = pcall(require, 'lint')
if lint_exists then

  lint.linters_by_ft = {
    markdown = {'markdownlint'},
    python = {'pylint'},
  }

  local pylint = require('lint').linters.pylint
  pylint.args = {
    '-f', 'json', '--disable=import-error'
  }

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePost', 'InsertLeave'}, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })

end
