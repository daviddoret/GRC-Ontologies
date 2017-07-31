require("lQuery")
local utils = require "plugin_mechanism.utils"
local configurator = require("configurator.configurator")

-- delete toolbar element
lQuery("ToolbarElementType[id=OWLGrEd_UserFields_Toolbar_Element]"):delete()
lQuery("ToolbarElementType[id=OWLGrEd_UserFields_Toolbar_Element_View]"):delete()
lQuery("ToolbarElementType[id=OWLGrEd_UserFields_View_Toolbar_Element]"):delete()
lQuery("ToolbarElementType[id=OWLGrEd_UserFields_Toolbar_Element_Styles]"):delete()
lQuery("ToolbarElementType[id=OWLGrEd_UserFields_Toolbar_Element_Styles_Dia]"):delete()
--lQuery("ToolbarElementType[procedureName='OWLGrEd_UserFields.styleMechanism.applyViewFromToolBar']"):delete()



lQuery("AA#View[showInPalette='true']"):each(function(view)
	local picture = lQuery("ToolbarElementType[id=" .. view:id() .. "]"):attr("picture")
	if picture~=nil then utils.delete(tda.GetProjectPath() .. "\\Pictures\\"..picture) end
	lQuery("ToolbarElementType[id=" .. view:id() .. "]"):delete()
end)
lQuery("AA#View[showInToolBar='true']"):each(function(view)
	local picture = lQuery("ToolbarElementType[id=" .. view:id() .. "]"):attr("picture")
	if picture~=nil then utils.delete(tda.GetProjectPath() .. "\\Pictures\\"..picture) end
	lQuery("ToolbarElementType[id=" .. view:id() .. "]"):delete()
end)

-- refresh project diagram
configurator.make_toolbar(lQuery("GraphDiagramType[id=projectDiagram]"))
configurator.make_toolbar(lQuery("GraphDiagramType[id=OWL]"))

-- delete toolbar element icon
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aa.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaView.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontal.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontalActivated.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVertical.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVerticalActivated.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaHideAnnotations.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaHideAnnotationsActivated.BMP")
utils.delete(tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaStyles.BMP")
local uncompleteMetamodel = require ("OWLGrEd_UserFields.uncompleteMetamodel")
uncompleteMetamodel.uncompleteMetamodel()

return true
-- return false, error_string