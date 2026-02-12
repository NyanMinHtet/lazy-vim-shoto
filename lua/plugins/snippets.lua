return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      -- load your custom snippets
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })

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
