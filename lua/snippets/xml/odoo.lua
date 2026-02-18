local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep

local function dot_to_underscore(text)
  return text:gsub("%.", "_")
end

local function mirror_dot_to_underscore(arg_index)
  return d(arg_index, function(args)
    return sn(nil, i(1, dot_to_underscore(args[1][1] or "")))
  end, { 1 })
end

return {
  s("odoo", {
    t("<?xml version='1.0' encoding='utf-8'?>"),
    t({ "", "<odoo>", "\t" }),
    i(0),
    t({ "", "</odoo>" }),
  }, { description = "Odoo tag" }),

  s("oform", {
    t("<!-- "), i(1, "model.name"), t(" form view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_form\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.form</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">" }),
    t({ "", "\t\t<form string=\"" }), i(3), t("\">"),
    t({ "", "\t\t\t<sheet>", "\t\t\t\t<group>", "\t\t\t\t\t<!-- Add your fields here -->", "\t\t\t\t\t" }),
    i(0),
    t({ "", "\t\t\t\t</group>", "\t\t\t</sheet>", "\t\t</form>", "\t</field>", "</record>" }),
  }, { description = "Create Form View" }),

  s("oformi", {
    t("<!-- "), i(1, "model.name"), t(" inherit form view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.form</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add your xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Form View" }),

  s("otree", {
    t("<!-- "), i(1, "model.name"), t(" tree view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_tree\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.tree</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<tree>", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</tree>", "\t</field>", "</record>" }),
  }, { description = "Create Tree View" }),

  s("otreei", {
    t("<!-- "), i(1, "model.name"), t(" inherit tree view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.tree</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add your xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Tree View" }),

  s("osearch", {
    t("<!-- "), i(1, "model.name"), t(" search view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_search\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.search</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<search string=\"" }), i(3, "Search Description"), t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</search>", "\t</field>", "</record>" }),
  }, { description = "Create Search View" }),

  s("osearchi", {
    t("<!-- "), i(1, "model.name"), t(" inherit search view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.search</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add your xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Search View" }),

  s("odash", {
    t("<!-- "), i(1, "model.name"), t(" dashboard view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_dashboard\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.dashboard</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<dashboard>", "\t\t\t<!-- Add your views here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</dashboard>", "\t</field>", "</record>" }),
  }, { description = "Create Dashboard View" }),

  s("ograph", {
    t("<!-- "), i(1, "model.name"), t(" graph view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_graph\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.graph</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<graph string=\"" }), i(3, "Graph Description"), t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</graph>", "\t</field>", "</record>" }),
  }, { description = "Create Graph View" }),

  s("ographi", {
    t("<!-- "), i(1, "model.name"), t(" inherit graph view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.graph</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add you xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Graph View" }),

  s("opivot", {
    t("<!-- "), i(1, "model.name"), t(" pivot view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_pivot\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.pivot</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<pivot string=\"" }), i(3, "Pivot Description"), t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</pivot>", "\t</field>", "</record>" }),
  }, { description = "Create Pivot View" }),

  s("opivoti", {
    t("<!-- "), i(1, "model.name"), t(" inherit pivot view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.pivot</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add you xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Pivot View" }),

  s("okanban", {
    t("<!-- "), i(1, "model.name"), t(" kanban view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_kanban\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.kanban</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<kanban string=\"" }), i(3, "Kanban Description"), t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</kanban>", "\t</field>", "</record>" }),
  }, { description = "Create Kanban View" }),

  s("okanbani", {
    t("<!-- "), i(1, "model.name"), t(" inherit kanban view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.kanban</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add you xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Kanban View" }),

  s("ocalendar", {
    t("<!-- "), i(1, "model.name"), t(" calendar view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_calendar\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.calendar</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<calendar string=\"" }),
    i(3, "Calendar Description"),
    t("\" date_start=\""),
    i(4, "date_start"),
    t("\" mode=\""),
    i(5, "month"),
    t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</calendar>", "\t</field>", "</record>" }),
  }, { description = "Create Calendar View" }),

  s("ocalendari", {
    t("<!-- "), i(1, "model.name"), t(" inherit calendar view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.calendar</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add you xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Calendar View" }),

  s("ogantt", {
    t("<!-- "), i(1, "model.name"), t(" gantt view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_view_gantt\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".view.gantt</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<gantt string=\"" }),
    i(3, "Gantt Description"),
    t("\" date_start=\""),
    i(4, "date_start"),
    t("\">"),
    t({ "", "\t\t\t<!-- Add your fields here -->", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</gantt>", "\t</field>", "</record>" }),
  }, { description = "Create Gantt View" }),

  s("ogantti", {
    t("<!-- "), i(1, "model.name"), t(" inherit gantt view -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("\" model=\"ir.ui.view\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".inherit.view.gantt</field>"),
    t({ "", "\t<field name=\"model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"inherit_id\" ref=\"" }), i(3, "base_module"), t("."), mirror_dot_to_underscore(2), t("\"/>"),
    t({ "", "\t<field name=\"arch\" type=\"xml\">", "\t\t<!-- Add you xpath here -->", "\t\t" }),
    i(0),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Inherit Existing Gantt View" }),

  s("oxpath", {
    t("<xpath expr=\"//"), i(1, "field"), t("[@"), i(2, "name"), t("='"), i(3, "name"), t("']\" position=\""), i(4, "after"), t("\">"),
    t({ "", "\t<!-- Add your fields here -->", "\t" }),
    i(0),
    t({ "", "</xpath>" }),
  }, { description = "Add the structure of xpath" }),

  s("oxpathattr", {
    t("<xpath expr=\"//"), i(1, "field"), t("[@"), i(2, "name"), t("='"), i(3, "name"), t("']\" position=\"attributes\">"),
    t({ "", "\t<attribute name=\"" }), i(4, "attrs"), t("\">"), t("{"), i(5), t("}</attribute>"),
    t({ "", "</xpath>" }),
  }, { description = "Add the structure of xpath to attributes" }),

  s("oact", {
    t("<!-- "), i(1, "model.name"), t(" action window -->"),
    t({ "", "<record id=\"" }),
    mirror_dot_to_underscore(2),
    t("_action\" model=\"ir.actions.act_window\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".action</field>"),
    t({ "", "\t<field name=\"type\">ir.actions.act_window</field>" }),
    t({ "", "\t<field name=\"res_model\">" }), rep(1), t("</field>"),
    t({ "", "\t<field name=\"view_mode\">" }), i(3, "tree,form"), t("</field>"),
    t({ "", "\t<field name=\"view_type\">form</field>" }),
    t({ "", "\t<field name=\"domain\">[" }), i(4), t("]</field>"),
    t({ "", "\t<field name=\"context\">{" }), i(5), t("}</field>"),
    t({ "", "\t<field name=\"target\">" }),
    c(6, { t("current"), t("new"), t("fullscreen"), t("main"), t("inline") }),
    t("</field>"),
    t({ "", "\t<field name=\"help\" type=\"html\">", "\t\t<p class=\"oe_view_nocontent_create\">", "\t\t\t<!-- Add Text Here -->", "\t\t</p><p>", "\t\t\t<!-- More details about what a user can do with this object will be OK --> " }),
    t({ "", "\t\t\t" }),
    i(0),
    t({ "", "\t\t</p>", "\t</field>", "</record>" }),
  }, { description = "Create new Action" }),

  s("onote", {
    t("<notebook>"),
    t({ "", "\t<page string=\"" }), i(1), t("\" name=\""), i(2), t("\">"),
    t({ "", "\t\t<group>", "\t\t\t<field name=\"" }), i(3), t("\"/>"),
    t({ "", "\t\t</group>", "\t</page>", "</notebook>" }),
  }, { description = "Add notebook and page tags" }),

  s("opage", {
    t("<page name=\""), i(1), t("\" string=\""), i(2), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</page>" }),
  }, { description = "Add new page tag" }),

  s("omenur", {
    t("<!-- This Menu Item will appear in the Upper bar, that's why It needs NO parent or action -->"),
    t({ "", "<menuitem id=\"" }), i(1), t("_menu_root\" name=\""), i(2), t("\" sequence=\""), i(3), t("\"/>"),
  }, { description = "Create New Menu Item in the Upper bar" }),

  s("omenuc", {
    t("<!-- This Menu Item Must have a parent -->"),
    t({ "", "<menuitem id=\"" }), i(1), t("_menu_categ\" name=\""), i(2), t("\" parent=\""), i(3), t("\" sequence=\""), i(4), t("\"/>"),
  }, { description = "Create New Menu Item for Categories" }),

  s("omenua", {
    t("<!-- This Menu Item must have a parent and an action -->"),
    t({ "", "<menuitem id=\"" }), i(1), t("_menu_act\" name=\""), i(2), t("\" parent=\""), i(3), t("\" action=\""), i(4), t("\" sequence=\""), i(5), t("\"/>"),
  }, { description = "Create New Menu Item for Actions" }),

  s("ocron", {
    t("<!-- "), i(1, "model.name"), t(" cron -->"),
    t({ "", "<record id=\"" }), i(2, "model_name"), t("_ir_cron\" forcecreate=\""), i(3, "True"), t("\" model=\"ir.cron\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".ir.cron</field>"),
    t({ "", "\t<field name=\"user_id\" ref=\"base.user_root\"/>" }),
    t({ "", "\t<field name=\"doall\" eval=\"" }), i(4, "False"), t("\"/>"),
    t({ "", "\t<field name=\"active\" eval=\"" }), i(5, "True"), t("\"/>"),
    t({ "", "\t<field name=\"interval_number\">" }), i(6, "1"), t("</field>"),
    t({ "", "\t<field name=\"interval_type\">" }), i(7, "minutes"), t("</field>"),
    t({ "", "\t<field name=\"numbercall\">" }), i(8, "-1"), t("</field>"),
    t({ "", "\t<field name=\"model_id\" ref=\"model_" }), rep(2), t("\"/>"),
    t({ "", "\t<field name=\"state\">code</field>" }),
    t({ "", "\t<field name=\"code\">model." }), i(9, "method_name"), t("()</field>"),
    t({ "", "\t<field name=\"priority\" eval=\"5\" />", "</record>" }),
  }, { description = "Add a ir.cron record" }),

  s("obtn", {
    t("<button name=\"action_"), i(1, "button_method_name"), t("\" type=\""), i(2, "object"), t("\" string=\""), i(3, "ObjectButton"), t("\"/>"),
  }, { description = "Add Odoo button" }),

  s("obtnbox", {
    t("<div class=\"oe_button_box\" name=\""), i(1, "model_name"), t("_button_box\">"),
    t({ "", "\t<button name=\"action_" }), i(2, "toggle_active"), t("\""),
    t({ "", "\t\t\ttype=\"object\"" }),
    t({ "", "\t\t\tconfirm=\"" }), i(3, "(Un)archiving a project automatically (un)archives its tasks and issues. Do you want to proceed?"), t("\""),
    t({ "", "\t\t\tclass=\"oe_stat_button\"" }),
    t({ "", "\t\t\ticon=\"fa-archive\">" }),
    t({ "", "\t\t\t<field name=\"" }), i(4, "active"), t("\" widget=\""), i(5, "boolean_button"), t("\" options='{\"terminology\": \"archive\"}'/>"),
    t({ "", "\t</button>", "</div>" }),
  }, { description = "Add Button Box on View" }),

  s("ogroup", {
    t("<group name=\""), i(1, "group_name"), t("\" string=\""), i(2, "group_string"), t("\">"),
    t({ "", "</group>" }),
  }, { description = "Create Group Tag" }),

  s("ofield", {
    t("<field name=\""), i(0, "name"), t("\"/>"),
  }, { description = "Create Field" }),

  s("odata", {
    t("\t<data noupdate=\""), i(1, "1"), t("\">"),
    t({ "", "\t\t<!-- Add you code here -->", "\t\t" }),
    i(0),
    t({ "", "\t</data>" }),
  }, { description = "Create Data Tag" }),

  s("ostatusbar", {
    t("<header>"),
    t({ "", "\t<field name=\"" }), i(1), t("\" widget=\"statusbar\"/>"),
    t({ "", "</header>" }),
  }, { description = "Create Header with Status Bar" }),

  s("oreport", {
    t("<report id=\"report_"), i(1), t("\""),
    t({ "", "\t\tstring=\"" }), i(2, "report_name"), t("\""),
    t({ "", "\t\tmodel=\"" }), i(3, "model_name"), t("\""),
    t({ "", "\t\treport_type=\"" }), i(4, "qweb-pdf"), t("\""),
    t({ "", "\t\tmenu=\"" }), i(5, "False"), t("\""),
    t({ "", "\t\tfile=\"" }), i(6, "module_name"), t("."), i(7, "template_name"), t("\""),
    t({ "", "\t\tname=\"" }), rep(6), t("."), rep(7), t("\"/>"),
  }, { description = "Create report tag" }),

  s("otemplate", {
    t("<template id=\"template_"), i(1, "template_id"), t("\" name=\""), i(2, "Template Name"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</template>" }),
  }, { description = "Create Odoo template tag" }),

  s("otemplatei", {
    t("<template id=\"template_"), i(1, "template_id"), t("\" inherit_id=\""), i(2, "module"), t("."), rep(1), t("\" name=\""), i(3, "Template Name"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</template>" }),
  }, { description = "Create Odoo template inherit tag" }),

  s("otcall", {
    t("<t t-call=\""), i(1, "module"), t("."), i(2, "template"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</t>" }),
  }, { description = "Create Odoo t-call tag" }),

  s("otforeach", {
    t("<t t-foreach=\""), i(1, "array"), t("\" t-as=\""), i(2, "obj"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</t>" }),
  }, { description = "Create Odoo t-foreach tag" }),

  s("otif", {
    t("<t t-if=\""), i(1, "condition"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</t>" }),
  }, { description = "Create Odoo t-if tag" }),

  s("otelif", {
    t("<t t-if=\""), i(1, "condition"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</t>", "<t t-elif=\"" }), i(2, "condition"), t("\">"),
    t({ "", "</t>", "<t t-else=\"\">" }),
    t({ "", "</t>" }),
  }, { description = "Create Odoo t-ifelse tag" }),

  s("otifelse", {
    t("<t t-if=\""), i(1, "condition"), t("\">"),
    t({ "", "\t" }), i(0),
    t({ "", "</t>", "<t t-else=\"\">" }),
    t({ "", "</t>" }),
  }, { description = "Create Odoo t-if and t-else tag" }),

  s("otraw", {
    t("<t t-raw=\""), i(0, "name"), t("\"/>"),
  }, { description = "Create Odoo t-raw tag" }),

  s("otesc", {
    t("<t t-esc=\""), i(0, "name"), t("\"/>"),
  }, { description = "Create Odoo t-esc tag" }),

  s("otset", {
    t("<t t-set=\""), i(1, "var_name"), t("\" t-value=\""), i(0, "value"), t("\"/>"),
  }, { description = "Create Odoo t-set tag" }),

  s("otfield", {
    t("<span t-field=\""), i(0, "field_name"), t("\"/>"),
  }, { description = "Create Odoo t-field tag" }),

  s("otimg", {
    t("<img t-att-src=\"'data:image/png;base64,%s' % to_text("), i(0, "field_name"), t(")\"/>"),
  }, { description = "Create Odoo templat image tag" }),

  s("ochatter", {
    t("<div class=\"oe_chatter\">"),
    t({ "", "\t<field name=\"message_follower_ids\" widget=\"mail_followers\"/>" }),
    t({ "", "\t<field name=\"activity_ids\" widget=\"mail_activity\"/>" }),
    t({ "", "\t<field name=\"message_ids\" widget=\"mail_thread\"/>" }),
    t({ "", "</div>" }),
  }, { description = "Create Odoo 'oechater' tag" }),

  s("oaurl", {
    t("\t<record id=\"action_"), i(1, "action_id"), t("\" model=\"ir.actions.act_url\">"),
    t({ "", "\t<field name=\"name\">" }), i(2, "name"), t("</field>"),
    t({ "", "\t<field name=\"url\">/" }), i(3, "url"), t("</field>"),
    t({ "", "\t<field name=\"target\">self</field>", "</record>" }),
  }, { description = "Create action.url tag" }),

  s("oaserver", {
    t("<!-- "), i(1, "model.name"), t(" action server -->"),
    t({ "", "<record id=\"action_" }), i(2, "model_name"), t("\" model=\"ir.actions.server\">"),
    t({ "", "\t<field name=\"name\">" }), rep(1), t(".action.server</field>"),
    t({ "", "\t<field name=\"model_id\" ref=\"model_" }), rep(1), t("\"/>"),
    t({ "", "\t<field name=\"state\">code</field>", "\t<field name=\"code\">" }),
    t({ "", "\t\trecord." }), i(3, "method_name"), t("()"),
    t({ "", "\t</field>", "</record>" }),
  }, { description = "Create action.server tag" }),

  s("oaclient", {
    t("<!-- "), i(1, "model.name"), t(" action client -->"),
    t({ "", "<record id=\"action_" }), i(2, "model_name"), t("\" model=\"ir.actions.client\">"),
    t({ "", "\t<field name=\"name\">" }), rep(2), t(".action.client</field>"),
    t({ "", "\t<field name=\"tag\" ref=\"" }), i(3, "tag_name"), t("\"/>"),
    t({ "", "\t<field name=\"context\" eval=\"{}\"/>", "</record>" }),
  }, { description = "Create action.client tag" }),
}
