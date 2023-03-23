local fn = require("user.functions")

-- Based on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    if ft == "lua" then
      fn.set_tab_width(2)
      fn.use_spaces()
    elseif ft == "fish" then
      fn.set_tab_width(4)
      fn.use_spaces()
    elseif ft == "markdown" then
      fn.set_tab_width(2)
      vim.opt.textwidth = 80
    elseif ft == "c" or ft == "cpp" then
      fn.set_tab_width(4)
    end

  end
})

-- Options for empty/text filetype
-- vim.api.nvim_create_autocmd({"BufEnter"}, {
--   pattern = { "*" },
--   callback = function(args)
--     local ft = vim.bo[args.buf].filetype
    -- if ft == "" or ft == "text" then
      -- vim.opt.number = false
      -- vim.opt.signcolumn = "number"
      -- vim.opt.textwidth = 80
    -- end
--   end
-- })

-- Associate .h with C instead of C++
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.h" },
  callback = function()
    vim.opt.filetype = "c"
  end
})
