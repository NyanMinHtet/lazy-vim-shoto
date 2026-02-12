return {
  {
    "zaldih/themery.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("themery").setup({
        themes = {
          "everforest",
          "rose-pine",
          "catppuccin",
          "tokyonight",
          "gruvbox",
          "onedark",
          "dracula",
          "moonfly",
        },
        initial_theme = "everforest",
        theme_preview = false,
      })
    end,
  },
}

