return {
  "LazyVim/LazyVim",
  opts = {
    keys = {
      -- Undo with Alt-z instead of Ctrl-z (to avoid terminal conflicts)
      { "<A-z>", "<cmd>undo<cr>", mode = { "n", "i" }, desc = "Undo" },

      -- Save with Ctrl-s
      { "<C-s>", "<cmd>w<cr>", mode = { "n", "i" }, desc = "Save File" },

      -- Close buffer with <leader>w
      { "<leader>w", "<cmd>bd<cr>", mode = { "n", "i" }, desc = "Close Buffer" },

      -- Quit with Ctrl-q
      { "<C-q>", "<cmd>q!<cr>", mode = { "n", "i" }, desc = "Quit" },
    },

    options = {
      relativenumber = true,
      mouse = "a",
      hlsearch = true,
      incsearch = true,
    },
  },
}
