require("lQuery")
local configurator = require("configurator.configurator")
local utils = require "plugin_mechanism.utils"
local completeMetamodel = require "OWLGrEd_UserFields.completeMetamodel"
local profileMechanism = require "OWLGrEd_UserFields.profileMechanism"
local syncProfile = require "OWLGrEd_UserFields.syncProfile"
local viewMechanism = require "OWLGrEd_UserFields.viewMechanism"

lQuery.model.add_property("AA#StyleSetting", "procSetValue")
lQuery.model.add_property("AA#Field", "isExistingField")

lQuery.model.add_class("AA#CustomStyleSetting")
	lQuery.model.add_property("AA#CustomStyleSetting", "elementTypeName")
	lQuery.model.add_property("AA#CustomStyleSetting", "compartTypeName")
	lQuery.model.add_property("AA#CustomStyleSetting", "parameterName")
	lQuery.model.add_property("AA#CustomStyleSetting", "parameterValue")
-- lQuery.model.add_class("AA#Parameter")
	-- lQuery.model.add_property("AA#Parameter", "name")
	-- lQuery.model.add_property("AA#Parameter", "value")
lQuery.model.set_super_class("AA#CustomStyleSetting", "AA#StyleSetting")

lQuery.model.add_class("SettingTag")
	lQuery.model.add_property("SettingTag", "tagName")
	lQuery.model.add_property("SettingTag", "tagValue")

lQuery.model.add_link("SettingTag", "settingTag", "elementStyleSetting", "ElementStyleSetting")
lQuery.model.add_link("SettingTag", "settingTag", "compartmentStyleSetting", "CompartmentStyleSetting")
lQuery.model.add_link("SettingTag", "settingTag", "ref", "Thing")
	
-- lQuery.model.add_link("AA#CustomStyleSetting", "styleSetting", "parameter", "AA#Parameter")
lQuery.model.add_composition("AA#CustomStyleSetting", "customStyleSetting", "viewStyleSetting", "AA#ViewStyleSetting")

lQuery.model.add_link("ElementStyleSetting", "dependingElementStyleSetting", "dependsOnCompartType", "CompartType")
lQuery.model.add_link("CompartmentStyleSetting", "dependingCompartmentStyleSetting", "dependsOnCompartType", "CompartType")

utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aa.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aa.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaView.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaView.BMP")

utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaStyles.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaStyles.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewHorizontal.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontal.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewHorizontalActivated.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewHorizontalActivated.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewVertical.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVertical.BMP")
		   
utils.copy(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\aaViewVerticalActivated.BMP",
           tda.GetProjectPath() .. "\\Pictures\\OWLGrEd_UserFields_aaViewVerticalActivated.BMP")

lQuery("AA#View[showInPalette='true']"):each(function(view)
		lQuery("ToolbarElementType[caption=" .. view:attr("name") .. "]"):delete()
end)
lQuery("AA#View[showInToolBar='true']"):each(function(view)
		lQuery("ToolbarElementType[caption=" .. view:attr("name") .. "]"):delete()
end)
		   
local pathContextType = tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\user\\AutoLoad"
local fileTable = syncProfile.attrdir(pathContextType)
for i,v in pairs(fileTable) do
	local profileNameStart = string.find(v, "/")
	local profileName = string.sub(v, profileNameStart+1, string.len(v)-4)

	local profile = lQuery("AA#Profile[name='" .. profileName .. "']")
	--izdzest AA# Dalu
	lQuery(profile):find("/field"):each(function(obj)
		profileMechanism.deleteField(obj)
	end)
	--saglabajam stilus
	lQuery("GraphDiagram:has(/graphDiagramType[id='OWL'])"):each(function(diagram)
		utilities.execute_cmd("SaveDgrCmd", {graphDiagram = diagram})
	end)
	--palaist sinhronizaciju
	syncProfile.syncProfile(profileName)
	viewMechanism.deleteViewFromProfile(profileName)
		--izdzest profilu, extension
	lQuery(profile):delete()
	lQuery("Extension[id='" .. profileName .. "'][type='aa#Profile']"):delete()
end

lQuery.model.add_property("AA#View", "showInToolBar")

completeMetamodel.loudAutoLoudProfiles(pathContextType)



lQuery("AA#View[showInToolBar='true']"):each(function(view)
	--local view = lQuery("AA#Profile[name='PaletteViews']/view[name='CompactHorizontalView']")
	--local view = lQuery("AA#Profile[name='PaletteViews']/view[name='Horizontal']")
	local owl_dgr_type = lQuery("GraphDiagramType[id=OWL]")
	local toolbarTypeOwl = owl_dgr_type:find("/toolbarType")
	if toolbarTypeOwl:is_empty() then
	  toolbarTypeOwl = lQuery.create("ToolbarType", {graphDiagramType = owl_dgr_type})
	end
		
	local view_manager_toolbar_el = lQuery.create("ToolbarElementType", {
		toolbarType = toolbarTypeOwl,
		id = view:id(),
		caption = view:attr("name"),
		picture = view:attr("inActiveIcon"),
		procedureName = "OWLGrEd_UserFields.styleMechanism.applyViewFromToolBar"
	})	
end)

configurator.make_toolbar(lQuery("GraphDiagramType[id=projectDiagram]"))
configurator.make_toolbar(lQuery("GraphDiagramType[id=OWL]"))

lQuery.create("PopUpElementType", {id="Style Palette", caption="Style Palette", nr=5, visibility=true, procedureName="OWLGrEd_UserFields.stylePalette.stylePaletteProgect"})
		:link("popUpDiagramType", lQuery("GraphDiagramType[id='projectDiagram']/rClickEmpty"))


		
--0.3
lQuery("AA#TransletTask"):delete()


lQuery.create("AA#TransletTask", {
							taskName = "procFieldEntered"})
lQuery.create("AA#TransletTask", {
							taskName = "procCompose"})
lQuery.create("AA#TransletTask", {
							taskName = "procDecompose"})
lQuery.create("AA#TransletTask", {
							taskName = "procGetPattern"})
lQuery.create("AA#TransletTask", {
							taskName = "procCheckCompartmentFieldEntered"})
lQuery.create("AA#TransletTask", {
							taskName = "procBlockingFieldEntered"})
lQuery.create("AA#TransletTask", {
							taskName = "procGenerateInputValue"})
lQuery.create("AA#TransletTask", {
							taskName = "procGenerateItemsClickBox"})
lQuery.create("AA#TransletTask", {
							taskName = "procForcedValuesEntered"})
lQuery.create("AA#TransletTask", {
							taskName = "procDeleteCompartmentDomain"})
lQuery.create("AA#TransletTask", {
							taskName = "procUpdateCompartmentDomain"})
lQuery.create("AA#TransletTask", {
							taskName = "procCreateCompartmentDomain"})							


lQuery.model.delete_property("AA#Tag", "axiomPattern")
lQuery.model.add_property("AA#Tag", "tagValue")



							
return true
-- return false, error_string