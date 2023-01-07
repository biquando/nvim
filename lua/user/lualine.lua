local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_z = { {"location", padding = 0} },
  },
  inactive_sections = {
    lualine_c = { "filename", "diff" },
    lualine_x = { "progress" },
  }
}
