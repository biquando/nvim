local cmp_exists, cmp = pcall(require, 'cmp')
if cmp_exists then

  cmp.setup({
    mapping = cmp.mapping.preset.insert {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
      { name = 'nvim_lsp' },
    },
  })

end
