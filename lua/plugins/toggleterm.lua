function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- for only toggle term, use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local toggleterm_exists, _ = pcall(require, 'toggleterm')
if toggleterm_exists then
  -- Default <C-\> (float)
  vim.keymap.set({ 'n' }, '<C-\\>', ':ToggleTerm direction=float<CR>')
  vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>:ToggleTerm direction=float<CR>')
  -- Float
  vim.keymap.set({ 'n' }, '<M-3>', ':ToggleTerm direction=float<CR>')
  vim.keymap.set('t', '<M-3>', '<C-\\><C-n>:ToggleTerm direction=float<CR>')
  -- Horizontal
  vim.keymap.set({ 'n' }, '<M-1>', ':ToggleTerm direction=horizontal<CR>')
  vim.keymap.set('t', '<M-1>', '<C-\\><C-n>:ToggleTerm direction=horizontal<CR>')
  -- Vertical
  vim.keymap.set({ 'n' }, '<M-2>', ':ToggleTerm direction=vertical<CR>')
  vim.keymap.set('t', '<M-2>', '<C-\\><C-n>:ToggleTerm direction=vertical<CR>')
end
