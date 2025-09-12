local map = vim.keymap.set
local del = vim.keymap.del

map("n", "<C-a>", ":%y<cr>", { desc = "Select all" })
-- Quit
del("n", "<leader>qq")
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

map("n", "<C-m>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- Paste and keep in visual mode
map("v", "p", '"_dP')

-- Yank to system clipboard
map("n", "y", '"+y')
map("v", "y", '"+y')
map("n", "Y", '"+Y')

-- Delete/change without yanking
map("n", "d", '"_d')
map("n", "c", '"_c')

-- Select all text
map("n", "<C-a-y>", ":%y<cr>", { desc = "Select all & yank" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- toggle terminal
map("n", "<C-t>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- New Tab
map("n", "te", ":tabedit")
-- map("n", "<tab>", ":tabnext<Return>", { desc = "Next Tab" })
-- map("n", "<s-tab>", ":tabprev<Return>", { desc = "Prev Tab" })

-- Exit insert mode with 'jj'
map("i", "jj", "<ESC>")

-- Scroll and center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Exit terminal mode
map("t", "<C-\\>", "<C-\\><C-n>")

-- Toggle symbols outline
map("n", "<leader>o", "<cmd>SymbolsOutline<cr>", { desc = "Toggle symbols outline" })
