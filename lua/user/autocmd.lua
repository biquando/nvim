-- SECTION: Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup(
  'YankHighlight',
  { clear = true }
)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- SECTION: Filetypes

-- Associate .h with C instead of C++
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = { '*.h' },
  callback = function(args)
    vim.bo[args.buf].filetype = 'c'
  end
})

-- Associate .s with arm64 instead of asm on Darwin
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = { '*.s' },
  callback = function(args)
    if vim.loop.os_uname().sysname == 'Darwin' then
      vim.bo[args.buf].filetype = 'arm64'
    end
  end
})

-- Associate .lasm with lasm
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = { '*.lasm' },
  callback = function(args)
    vim.bo[args.buf].filetype = 'lasm'
  end
})

-- SECTION: Indentation

local ft_indents = {
  DEFAULT  = { 4, true },
  arm64    = { 8, true },
  bash     = { 2, true },
  c        = { 4, true },
  cpp      = { 4, true },
  fish     = { 4, true },
  haskell  = { 2, true },
  json     = { 2, true },
  lua      = { 2, true },
  make     = { 8, false },
  markdown = { 2, true },
  python   = { 4, true },
  rust     = { 4, true },
  sh       = { 2, true },
  tex      = { 4, true },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(args)
    local buf = vim.bo[args.buf]
    local ft = buf.filetype

    SET_INDENT(buf, ft_indents['DEFAULT'][1], ft_indents['DEFAULT'][2], false)
    for lang, indenting in pairs(ft_indents) do
      if ft == lang then
        SET_INDENT(buf, indenting[1], indenting[2], false)
        break
      end
    end
  end
})
