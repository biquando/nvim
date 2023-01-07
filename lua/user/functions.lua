local M = {}

-- Utilities
M.dump = function (o)
  if type(o) == "table" then
    local s = "{"
    for k, v in pairs(o) do
      if type(k) ~= "number" then k = '"'..k..'"' end
      s = s .. "["..k.."] = " .. M.dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

-- Tabs and Spaces

M.set_tab_width = function (w)
  if tonumber(w) < 1 then
    return
  end
  vim.opt.tabstop = tonumber(w)
  vim.opt.shiftwidth = tonumber(w)
end
vim.api.nvim_create_user_command("TabWidth",
  [[lua require("user.functions").set_tab_width(<f-args>)]], { nargs = 1 })

M.use_spaces = function ()
  vim.opt.expandtab = true
  vim.cmd [[ retab! ]]
end
vim.api.nvim_create_user_command("Spaces",
  [[lua require("user.functions").use_spaces()]], {})

M.use_tabs = function ()
  vim.opt.expandtab = false
  vim.cmd [[ retab! ]]
end
vim.api.nvim_create_user_command("Tabs",
  [[lua require("user.functions").use_tabs()]], {})

-- Aliases --
vim.cmd [[ command! -nargs=0 W w ]]

return M
