local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  reload_on_bufenter = true,
  filesystem_watchers = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
  }
}
