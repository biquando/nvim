local harpoon_exists, harpoon = pcall(require, 'harpoon')
if harpoon_exists then

  -- SECTION: Options
  harpoon.setup({
      menu = {
        width = math.min(100, vim.api.nvim_win_get_width(0) - 10),
      },
  })

  -- SECTION: Keymaps

  local mark = require('harpoon.mark')
  local ui = require('harpoon.ui')

  vim.keymap.set('n', '<leader>a', mark.add_file)
  vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

  vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
  vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
  vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
  vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)

  vim.keymap.set('n', '<S-h>', function() ui.nav_prev() end)
  vim.keymap.set('n', '<S-l>', function() ui.nav_next() end)
end
