-- Converted Odoo VSCode Snippets for LuaSnip
-- Source: https://github.com/mstuttgart/odoo-snippets

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

-- Helper function for dynamic text transformations
local function transform(arg_indexes, func)
  return d(2, function(snip_args)
    local parent_text = snip_args[1][1]
    if parent_text then
      return sn(nil, i(1, func(parent_text)))
    end
    return sn(nil, i(1))
  end, arg_indexes)
end

-- Capitalize words and replace separators
local function capitalize_and_space(text)
  local result = ""
  for part in string.gmatch(text, "[^%._]+") do
    result = result .. string.upper(string.sub(part, 1, 1)) .. string.sub(part, 2) .. " "
  end
  return result:gsub("%s$", "")
end

-- Replace underscore with dot
local function underscore_to_dot(text)
  return text:gsub("_", ".")
end

local python_snippets = {
  s("ipdb", {
    t("import ipdb; ipdb.set_trace()  # noqa"),
    f(function() return "" end, {}),
  }, { description = "Add ipdb debugger command" }),

  s("oman", {
    t("{"),
    t({ "    'name': '" }), i(1), t("',"),
    t({ "    'version': '" }), c(2, { t("1.0"), t("") }), t("',"),
    t({ "    'summary': '" }), i(3), t("',"),
    t({ "    'category': '" }), i(4), t("',"),
    t({ "    'author': '" }), i(5), t("',"),
    t({ "    'maintainer': '" }), r(5, ""), t("',"),
    t({ "    'website': '" }), i(6), t("',"),
    t({ "    'license': '" }), i(7), t("',"),
    t({ "    'contributors': [" }),
    t({ "        '" }), i(8), t("',"),
    t({ "    ]," }),
    t({ "    'depends': [" }),
    t({ "        '" }), i(9), t("',"),
    t({ "    ]," }),
    t({ "    'external_dependencies': {" }),
    t({ "        'python': [" }),
    t({ "            '" }), i(10), t("',"),
    t({ "        ]," }),
    t({ "    }," }),
    t({ "    'data': [" }),
    t({ "        '" }), i(11), t("',"),
    t({ "    ]," }),
    t({ "    'installable': " }), c(12, { t("True"), t("False") }), t(","),
    t({ "    'auto_install': " }), c(13, { t("False"), t("True") }), t(","),
    t({ "    'application': " }), c(14, { t("False"), t("True") }), t(","),
    t("}"),
    f(function() return "" end, {}),
  }, { description = "Create Odoo Manifest" }),

  s("omod", {
    t({ "", "", "class " }), transform({ 1 }, capitalize_and_space), t("(models."), c(3, { t("Model"), t("AbstractModel") }), t("):"),
    t({ "    _name = '" }), i(1, "model.technical.name"), t("'"),
    t({ "    _description = '" }), transform({ 1 }, capitalize_and_space), t("'"),
    f(function() return "" end, {}),
  }, { description = "Create New Odoo Model" }),

  s("omodi", {
    t({ "", "", "class " }), transform({ 1 }, capitalize_and_space), t("(models."), c(3, { t("Model"), t("AbstractModel") }), t("):"),
    t({ "    _inherit = '" }), i(1, "model.technical.name"), t("'"),
    f(function() return "" end, {}),
  }, { description = "Inherit Existing Odoo Model" }),

  s("owiz", {
    t({ "", "", "class " }), transform({ 1 }, capitalize_and_space), t("(models.TransientModel):"),
    t({ "    _name = '" }), i(1, "model.technical.name"), t("'"),
    t({ "    _description = '" }), transform({ 1 }, capitalize_and_space), t("'"),
    f(function() return "" end, {}),
  }, { description = "Create New Odoo Wizard" }),

  s("owizi", {
    t({ "", "", "class " }), transform({ 1 }, capitalize_and_space), t("(models.TransientModel):"),
    t({ "    _inherit = '" }), i(1, "model.technical.name"), t("'"),
    f(function() return "" end, {}),
  }, { description = "Inherit Existing Odoo Wizard" }),

  s("omodt", {
    t({ "", "", "class Test" }), i(1, "ModuleName"), t("("), c(3, { t("TransactionCase"), t("SingleTransactionCase"), t("SavepointCase"), t("HttpCase") }), t("):"),
    t({ "", "    def setUp(self):" }),
    t({ "        super(Test" }), r(1, "ModuleName"), t(", self).setUp()"),
    f(function() return "" end, {}),
  }, { description = "Add Test Class to Odoo Model" }),

  s("ofbin", {
    i(1, "new_field"), t(" = fields.Binary(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Binary" }),

  s("ofbool", {
    i(1, "new_field"), t(" = fields.Boolean(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Boolean" }),

  s("ofchar", {
    i(1, "new_field"), t(" = fields.Char(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Char" }),

  s("ofdate", {
    i(1, "new_field"), t(" = fields.Date(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Date" }),

  s("oftime", {
    i(1, "new_field"), t(" = fields.Datetime(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type DateTime" }),

  s("offloat", {
    i(1, "new_field"), t(" = fields.Float(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Float" }),

  s("ofhtml", {
    i(1, "new_field"), t(" = fields.Html(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type HTML" }),

  s("ofint", {
    i(1, "new_field"), t(" = fields.Integer(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Integer" }),

  s("oftxt", {
    i(1, "new_field"), t(" = fields.Text(string='"), i(2), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Text" }),

  s("ofsel", {
    i(1, "new_field"), t(" = fields.Selection(string='"), i(2), t("', selection=[('"), i(3), t("', '"), i(4), t("'), ('"), i(5), t("', '"), i(6), t("'),])"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Selection" }),

  s("ofm2o", {
    i(1, "new_field"), t(" = fields.Many2one(comodel_name='"), i(2), t("', string='"), i(3), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Many2one" }),

  s("ofm2m", {
    i(1, "new_field"), t(" = fields.Many2many(comodel_name='"), i(2), t("', string='"), i(3), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type Many2many" }),

  s("ofo2m", {
    i(1, "new_field"), t(" = fields.One2many(comodel_name='"), i(2), t("', inverse_name='"), i(3), t("', string='"), i(4), t("')"),
    f(function() return "" end, {}),
  }, { description = "Add new field of type One2many" }),

  s("omcreate", {
    t({ "@api.model", "def create(self, values):", "    # Add code here", "    return super(" }),
    i(1, "ClassName"),
    t(", self).create(values)"),
    f(function() return "" end, {}),
  }, { description = "Add a method create" }),

  s("omwrite", {
    t({ "@api.multi", "def write(self, values):", "    # Add code here", "    return super(" }),
    i(1, "ClassName"),
    t(", self).write(values)"),
    f(function() return "" end, {}),
  }, { description = "Add a method write" }),

  s("omunlink", {
    t({ "@api.multi", "def unlink(self):", "    # Add code here", "    return super(" }),
    i(1, "ClassName"),
    t(", self).unlink()"),
    f(function() return "" end, {}),
  }, { description = "Add a method unlink" }),

  s("omcomp", {
    t("@api.depends('"), i(1, "field_name"), t("')"),
    t({ "", "def _compute_" }), r(1, "field_name"), t("(self):"),
    t({ "    self." }), r(1, "field_name"), t(" = ''"),
    f(function() return "" end, {}),
  }, { description = "Add a method compute" }),

  s("omconst", {
    t("@api.constrains('"), i(1, "field_name"), t("')"),
    t({ "", "def _check_" }), r(1, "field_name"), t("(self):"),
    t({ "    if 1 == 1:" }),
    t({ "        raise ValidationError()" }),
    f(function() return "" end, {}),
  }, { description = "Add a constraint method" }),

  s("omchange", {
    t("@api.onchange('"), i(1, "field_name"), t("')"),
    t({ "", "def _onchange_" }), r(1, "field_name"), t("(self):"),
    t({ "    self." }), r(1, "field_name"), t(" = ''"),
    f(function() return "" end, {}),
  }, { description = "Add a method onchange" }),

  s("ousercomp", {
    t("self.env.user.company_id"),
    f(function() return "" end, {}),
  }, { description = "Get the user's company record" }),

  s("oimp", {
    t("from odoo import _, api, fields, models"),
    f(function() return "" end, {}),
  }, { description = "Add Odoo import" }),

  s("oimpt", {
    t("from odoo.tests.common import  "), c(1, { t("TransactionCase"), t("SingleTransactionCase"), t("SavepointCase"), t("HttpCase") }),
    f(function() return "" end, {}),
  }, { description = "Add Import to Odoo Tests" }),

  s("oimper", {
    t("from odoo.exceptions import "), c(1, { t("ValidationError"), t("RedirectWarning"), t("AccessDenied"), t("AccessError"), t("CacheMiss"), t("MissingError"), t("UserError") }),
    f(function() return "" end, {}),
  }, { description = "Add return to Action Window Close" }),

  s("oret_act_close", {
    t("return {'type': 'ir.actions.act_window_close'}"),
    f(function() return "" end, {}),
  }, { description = "Add return to Action Window Close" }),

  s("oret_act_win", {
    t("return {"),
    t({ "    'name': ('" }), i(1, "model.name.action"), t("'),"),
    t({ "    'type': 'ir.actions.act_window'," }),
    t({ "    'res_model': '" }), i(1, "model.name"), t("',"),
    t({ "    'view_type': 'form'," }),
    t({ "    'view_mode': '" }), i(3, "tree,form"), t("',"),
    t({ "    'target': '" }), c(4, { t("current"), t("new"), t("fullscreen"), t("main"), t("inline") }), t("',"),
    t({ "    'domain': [" }), i(5), t("],"),
    t({ "    'context': {" }), i(6), t("},"),
    t("}"),
    f(function() return "" end, {}),
  }, { description = "Add return to Action Window" }),
}

local xml_snippets = {
  s("odoo", {
    t({ '<?xml version="1.0" encoding="utf-8"?>', "<odoo>", "    <data>", "        " }),
    i(1),
    t({ "", "    </data>", "</odoo>" }),
  }, { description = "Adds a odoo base structure" }),

  s("oform", {
    t('<record id="'), i(1), t('" model="ir.ui.view">'),
    t({ "    <field name=\"name\">" }), i(2), t("</field>"),
    t({ "    <field name=\"model\">" }), i(3), t("</field>"),
    t({ "    <field name=\"arch\" type=\"xml\">" }),
    t({ "        <form string=\"\">" }),
    t({ "            <sheet>" }),
    t({ "                <group>" }),
    t({ "                    " }), i(4),
    t({ "                </group>" }),
    t({ "            </sheet>" }),
    t({ "        </form>" }),
    t({ "    </field>" }),
    t("</record>"),
  }, { description = "Create a new form view" }),

  s("otree", {
    t('<record id="'), i(1), t('" model="ir.ui.view">'),
    t({ "    <field name=\"name\">" }), i(2), t("</field>"),
    t({ "    <field name=\"model\">" }), i(3), t("</field>"),
    t({ "    <field name=\"arch\" type=\"xml\">" }),
    t({ "        <tree string=\"\">" }),
    t({ "            " }), i(4),
    t({ "        </tree>" }),
    t({ "    </field>" }),
    t("</record>"),
  }, { description = "Create a new tree view" }),

  s("osearch", {
    t('<record id="'), i(1), t('" model="ir.ui.view">'),
    t({ "    <field name=\"name\">" }), i(2), t("</field>"),
    t({ "    <field name=\"model\">" }), i(3), t("</field>"),
    t({ "    <field name=\"arch\" type=\"xml\">" }),
    t({ "        <search string=\"\">" }),
    t({ "            " }), i(4),
    t({ "        </search>" }),
    t({ "    </field>" }),
    t("</record>"),
  }, { description = "Create a new search view" }),

  s("ofield", {
    t('<field name="'), i(1), t('"/>'),
  }, { description = "Add a new field" }),

  s("ogroup", {
    t('<group string="'), i(1), t('">'),
    t({ "    " }), i(2),
    t("</group>"),
  }, { description = "Add a new group" }),

  s("onotebook", {
    t("<notebook>"),
    t({ "    <page string=\"" }), i(1), t("\">"),
    t({ "        " }), i(2),
    t({ "    </page>" }),
    t("</notebook>"),
  }, { description = "Add a notebook with a page" }),

  s("oaction", {
    t('<record id="'), i(1), t('" model="ir.actions.act_window">'),
    t({ "    <field name=\"name\">" }), i(2), t("</field>"),
    t({ "    <field name=\"res_model\">" }), i(3), t("</field>"),
    t({ "    <field name=\"view_mode\">" }), i(4, "tree,form"), t("</field>"),
    t("</record>"),
  }, { description = "Create a new window action" }),

  s("omenu", {
    t('<menuitem id="'), i(1), t('" name="'), i(2), t('" parent="'), i(3), t('" action="'), i(4), t('"/>'),
  }, { description = "Create a new menu item" }),

  s("otemplate", {
    t('<template id="'), i(1), t('" name="'), i(2), t('">'),
    t({ "    " }), i(3),
    t("</template>"),
  }, { description = "Create a new qweb template" }),
}

local csv_snippets = {
  s("ocolumns", {
    t("id,name,model_id:id,group_id:id,perm_read,perm_write,perm_create,perm_unlink"),
  }, { description = "Add Access Columns" }),

  s("oaccess", {
    t("access_"), i(1, "model_technical_name"), t("_"), i(2, "group_name"), t(","),
    d(3, function(args) return sn(nil, i(1, underscore_to_dot(args[1][1]))) end, { 1 }), t("."),
    d(4, function(args) return sn(nil, i(1, underscore_to_dot(args[1][1]))) end, { 2 }), t(","),
    t("model_"), r(5, "1"), t(","),
    i(6, "group.name"), t(","),
    c(7, { t("1"), t("0") }), t(","),
    c(8, { t("1"), t("0") }), t(","),
    c(9, { t("1"), t("0") }), t(","),
    c(10, { t("1"), t("0") }),
  }, { description = "Add entry to Access Group" }),
}

return {
  python = python_snippets,
  xml = xml_snippets,
  csv = csv_snippets,
}
