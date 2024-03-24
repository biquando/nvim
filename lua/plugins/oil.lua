local oil_exists, oil = pcall(require, 'oil')
if oil_exists then

  oil.setup()

  vim.keymap.set('n', '<leader>e', oil.toggle_float)

end
