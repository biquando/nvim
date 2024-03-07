local harpoon_exists, harpoon = pcall(require, 'harpoon')
if harpoon_exists then

  -- SECTION: Options
  harpoon.setup({
      menu = {
        width = math.min(100, vim.api.nvim_win_get_width(0) - 10),
      },
  })

  -- SECTION: Keymaps

  vim.keymap.set({'n'}, '<Leader>a',
    function()
      require('harpoon.mark').add_file()
    end
  )

  vim.keymap.set({'n'}, '<Leader>l',
    function()
      require('harpoon.ui').toggle_quick_menu()
    end
  )

  vim.keymap.set({'n'}, '<S-h>',
    function()
      require('harpoon.ui').nav_prev()
    end
  )

  vim.keymap.set({'n'}, '<S-l>',
    function()
      require('harpoon.ui').nav_next()
    end
  )
end
