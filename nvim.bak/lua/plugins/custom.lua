return {
  -- Odoo LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.odoo then
        configs.odoo = {
          default_config = {
            cmd = { "/home/nyanminhtet/odoo-lsp/target/release/odoo-lsp" },
            filetypes = { "python", "xml" },
            root_dir = lspconfig.util.root_pattern("odoo.conf", ".git"),
            single_file_support = true,
          },
        }
      end

      lspconfig.odoo.setup({})
    end,
  },

  -- Python LSP and formatter configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
      },
    },
  },
}
