local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Odoo Manifest
  s("oman", {
    t({ "{", "    'name': '" }),
    i(1, "Module Name"),
    t("',"),
    t({ "", "    'version': '" }),
    i(2, "1.0"),
    t("',"),
    t({ "", "    'summary': '" }),
    i(3, "Summary"),
    t("',"),
    t({ "", "    'depends': ['" }),
    i(4, "base"),
    t("'],"),
    t({ "", "    'data': [", "        '" }),
    i(5, "views/view.xml"),
    t("',", "    ],"),
    t({ "", "    'installable': True,", "}" }),
  }),

  -- New Odoo Model
  s("omod", {
    t("class "),
    i(1, "ModelName"),
    t("(models.Model):"),
    t({ "", "    _name = '" }),
    i(2, "model.name"),
    t("'"),
    t({ "", "    _description = '" }),
    i(3, "Description"),
    t("'"),
    t({ "", "", "    " }),
    i(0),
  }),

  -- Inherit Odoo Model
  s("omodi", {
    t("class "),
    i(1, "ModelName"),
    t("(models.Model):"),
    t({ "", "    _inherit = '" }),
    i(2, "model.name"),
    t("'"),
    t({ "", "", "    " }),
    i(0),
  }),

  -- Fields
  s("ofchar", {
    i(1, "field_name"),
    t(" = fields.Char(string='"),
    i(2, "Label"),
    t("')"),
  }),

  s("ofint", {
    i(1, "field_name"),
    t(" = fields.Integer(string='"),
    i(2, "Label"),
    t("')"),
  }),

  s("ofbool", {
    i(1, "field_name"),
    t(" = fields.Boolean(string='"),
    i(2, "Label"),
    t("')"),
  }),

  s("ofm2o", {
    i(1, "field_name"),
    t(" = fields.Many2one(comodel_name='"),
    i(2, "res.partner"),
    t("', string='"),
    i(3, "Label"),
    t("')"),
  }),

  s("ofo2m", {
    i(1, "field_name"),
    t(" = fields.One2many(comodel_name='"),
    i(2, "res.partner"),
    t("', inverse_name='"),
    i(3, "rel_id"),
    t("', string='"),
    i(4, "Label"),
    t("')"),
  }),

  -- Methods
  s("omcreate", {
    t({ "@api.model", "def create(self, vals_list):", "    " }),
    i(1, "## process"),
    t({ "", "    return super(" }),
    i(2, "ClassName"),
    t(", self).create(vals_list)"),
  }),

  s("omwrite", {
    t({ "def write(self, vals):", "    " }),
    i(1, "## process"),
    t({ "", "    return super(" }),
    i(2, "ClassName"),
    t(", self).write(vals)"),
  }),

  s("omcomp", {
    t("@api.depends('"),
    i(1, "field_name"),
    t("')"),
    t({ "", "def _compute_" }),
    f(function(args)
      return args[1][1] or ""
    end, { 1 }),
    t("(self):"),
    t({ "", "    for record in self:", "        record." }),
    f(function(args)
      return args[1][1] or ""
    end, { 1 }),
    t(" = "),
    i(0),
  }),

  -- Imports
  s("imp", {
    t("from odoo import api, fields, models, _"),
  }),
}
