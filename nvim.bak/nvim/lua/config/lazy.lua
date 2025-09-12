local plugins = {
  -- LSP and autocompletion
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Python LSP (Pyright)
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- XML LSP (Lemminx)
      lspconfig.lemminx.setup({
        capabilities = capabilities,
      })

      -- JavaScript/TypeScript LSP (TSServer)
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
    end,
  },

  -- Debugging (optional)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end,
  },

  -- Odoo snippets (optional)
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "nfaoro/odoo.nvim",
    event = "VeryLazy",
    config = function()
      require("odoo").setup()
    end,
  },
}

require("lazy").setup(plugins)