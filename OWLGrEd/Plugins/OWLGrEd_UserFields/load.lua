require("lQuery")
local configurator = require("configurator.configurator")
local utils = require "plugin_mechanism.utils"
local completeMetamodel = require "OWLGrEd_UserFields.completeMetamodel"
local completeMetamodelOWLGrEdSpecific = require "OWLGrEd_UserFields.completeMetamodelOWLGrEdSpecific"

-- copy icon to pictures
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aa.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aa.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaView.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaView.BMP")

utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaStyles.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaStyles.BMP")
------------------------------------------------------------------------------------------------------------		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewHorizontal.BMP",-------------------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontal.BMP")-------------------
		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewHorizontalActivated.BMP",----------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontalActivated.BMP")----------
		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewVertical.BMP",---------------------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVertical.BMP")---------------------
		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewVerticalActivated.BMP",------------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVerticalActivated.BMP")------------
		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaHideAnnotationsActivated.BMP",---------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaHideAnnotationsActivated.BMP")---------
		   
-- utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaHideAnnotations.BMP",------------------
           -- tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaHideAnnotations.BMP")------------------
------------------------------------------------------------------------------------------------------------
local project_dgr_type = lQuery("GraphDiagramType[id=projectDiagram]")
-- local owl_dgr_type = lQuery("GraphDiagramType[id=OWL]")-----------------------------------------------------

-- get or create toolbar type
local toolbarType = project_dgr_type:find("/toolbarType")
if toolbarType:is_empty() then
  toolbarType = lQuery.create("ToolbarType", {graphDiagramType = project_dgr_type})
end
--------------------------------------------------------------------------------------------------------------
-- local toolbarTypeOwl = owl_dgr_type:find("/toolbarType")------------------------------------------------------
-- if toolbarTypeOwl:is_empty() then-----------------------------------------------------------------------------
  -- toolbarTypeOwl = lQuery.create("ToolbarType", {graphDiagramType = owl_dgr_type})----------------------------
-- end-----------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

--complete metamodel
completeMetamodel.completeMetamodel()
completeMetamodelOWLGrEdSpecific.completeMetamodel()

-- refresh project diagram toolbar
configurator.make_toolbar(project_dgr_type)
-- configurator.make_toolbar(owl_dgr_type)---------------------------------------------------------------



return true
-- return false, error_string