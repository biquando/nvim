local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in command line to display messages
  colorcolumn = { 81, 101 },
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  cursorlineopt = "number",                -- only highlight the current line number
  display = "lastline,msgsep,uhex",
  expandtab = false,                       -- don't convert tabs to spaces
  fileencoding = "utf-8",
  guifont = "monospace:h17",
  hlsearch = true,
  ignorecase = true,
  list = true,                             -- show trailing spaces
  listchars = { tab = "  ", trail = "~", nbsp = "+" },
  mouse = "a",
  number = true,                           -- show line numbers
  pumheight = 10,                          -- pop up menu height
  scrolloff = 8,                           -- start scrolling when 8 lines from the top/bottom
  shiftwidth = 8,                          -- number of spaces inserted for each indentation
  showmode = false,                        -- don't show things like -- INSERT --
  showtabline = 2,                         -- always show tabs
  sidescrolloff = 8,                       -- see scrolloff
  signcolumn = "yes:1",                    -- width of 1
  smartcase = true,
  smartindent = true,
  softtabstop = -1,                        -- set equal to shiftwidth
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 8,
  textwidth = 0,
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete
  undofile = true,                         -- persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  wrap = true,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,]"  -- wrap left/right in normal/insert mode

-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
