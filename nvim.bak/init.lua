-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.wildignore:append("__pycache__")


local function is_git_repo()
  return vim.fn.isdirectory(".git") == 1
end

local function live_grep_git_root()
  if is_git_repo() then
    require("telescope.builtin").live_grep({
      search_dirs = { vim.fn.systemlist("git rev-parse --show-toplevel")[1] },
    })
  else
    require("telescope.builtin").live_grep()
  end
end

vim.keymap.set("n", "<leader>fg", live_grep_git_root, { desc = "Grep (in git root or cwd)" })