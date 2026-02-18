return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      -- load your custom snippets
      local snippet_path = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/snippets")
      require("luasnip.loaders.from_lua").load({
        paths = { snippet_path },
      })

      -- xml snippets are loaded via the lua loader from lua/snippets/xml

      -- explicit snippet keys (avoid mapping conflicts)
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- load custom odoo snippets (single file with ft tables)
      local ok, odoo = pcall(require, "custom.snippets.odoo")
      if ok then
        if odoo.python then
          ls.add_snippets("python", odoo.python)
        end
        if odoo.xml then
          ls.add_snippets("xml", odoo.xml)
        end
        if odoo.csv then
          ls.add_snippets("csv", odoo.csv)
        end
      end

      -- load friendly snippets (for testing autocomplete works)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
