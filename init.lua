-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local autosave_group = vim.api.nvim_create_augroup("AutoSave", {})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "WinLeave", "FocusLost" }, {
  group = autosave_group,
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent write")
    end
  end,
})
vim.notify("File autosaved", vim.log.levels.INFO)

