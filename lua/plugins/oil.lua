local oil_exists, oil = pcall(require, 'oil')
if oil_exists then

  oil.setup({
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<Esc>'] = 'actions.close',
    },
    view_options = {
      show_hidden = true,
    },
  })

  vim.keymap.set('n', '<leader>e', oil.toggle_float)

end
