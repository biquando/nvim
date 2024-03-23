local harpoon_exists, harpoon = pcall(require, 'harpoon')
if harpoon_exists then

  -- SECTION: Options
  harpoon.setup({
    menu = {
      width = math.min(100, vim.api.nvim_win_get_width(0) - 10),
    },
    tabline = true,
  })

  -- need to call this because tabline messes with the colors
  require('user.colors').set_colors()

  -- SECTION: Keymaps

  local mark = require('harpoon.mark')
  local ui = require('harpoon.ui')
  local term = require('harpoon.term')

  -- Add / list files
  vim.keymap.set('n', '<leader>a', function()
    mark.add_file()
    vim.cmd('redrawtabline')
  end)
  vim.keymap.set({'n', 't'}, '<C-e>', ui.toggle_quick_menu)

  -- Goto file
  vim.keymap.set({'n', 't'}, '<C-h>', function() ui.nav_file(1) end)
  vim.keymap.set({'n', 't'}, '<C-j>', function() ui.nav_file(2) end)
  vim.keymap.set({'n', 't'}, '<C-k>', function() ui.nav_file(3) end)
  vim.keymap.set({'n', 't'}, '<C-l>', function() ui.nav_file(4) end)

  -- Left / right
  vim.keymap.set('n', '<S-h>', function() ui.nav_prev() end)
  vim.keymap.set('n', '<S-l>', function() ui.nav_next() end)

  -- Terminals
  vim.keymap.set('n', '<C-n>', function() term.gotoTerminal(1) end)
  vim.keymap.set('n', '<C-m>', function() term.gotoTerminal(2) end)

end
