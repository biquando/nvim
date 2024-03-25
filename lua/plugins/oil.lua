local oil_exists, oil = pcall(require, 'oil')
if oil_exists then

  oil.setup({
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  })

  vim.keymap.set('n', '<leader>e', oil.toggle_float)

end
