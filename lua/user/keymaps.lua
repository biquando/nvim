-- [[ Basic Keymaps ]]
-- NOTE: The leader key is set in user.options

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Forward/backward in insert mode
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')

-- Keymaps for toggleterm
local toggleterm_exists, _ = pcall(require, 'toggleterm')
if toggleterm_exists then
  -- Default <C-\> (float)
  vim.keymap.set({ 'n', 'i', }, '<C-\\>', ':ToggleTerm direction=float<CR>')
  vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>:ToggleTerm direction=float<CR>')
  -- Float
  vim.keymap.set({ 'n', 'i', }, '<M-3>', ':ToggleTerm direction=float<CR>')
  vim.keymap.set('t', '<M-3>', '<C-\\><C-n>:ToggleTerm direction=float<CR>')
  -- Horizontal
  vim.keymap.set({ 'n', 'i', }, '<M-1>', ':ToggleTerm direction=horizontal<CR>')
  vim.keymap.set('t', '<M-1>', '<C-\\><C-n>:ToggleTerm direction=horizontal<CR>')
  -- Vertical
  vim.keymap.set({ 'n', 'i', }, '<M-2>', ':ToggleTerm direction=vertical<CR>')
  vim.keymap.set('t', '<M-2>', '<C-\\><C-n>:ToggleTerm direction=vertical<CR>')
end
