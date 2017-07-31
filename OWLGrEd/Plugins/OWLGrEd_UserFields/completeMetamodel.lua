module(..., package.seeall)

require("lua_tda")
require "lpeg"
require "core"
syncProfile = require "OWLGrEd_UserFields.syncProfile"
styleMechanism = require "OWLGrEd_UserFields.styleMechanism"
addRemoveToolbarElements = require "OWLGrEd_UserFields.addRemoveToolbarElements"
axiom = require "OWLGrEd_UserFields.axiom"

function completeMetamodel()
--print("complete STARTED")
	
	local f = assert(io.open(tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\config.txt", "r"))
    local t = f:read("*all")
	f:close()
	local pat = lpeg.P("showAdvancedByDefault") * lpeg.S(" \n\t") ^ 0 * lpeg.P("=") * lpeg.S(" \n\t") ^ 0 * lpeg.C(lpeg.R("09"))
	local pat = anywhere(pat)
	local resultShowAdvancedByDefault = lpeg.match(pat, t)
	if resultShowAdvancedByDefault=="1" then addRemoveToolbarElements.addUserFieldsToolbarElements() 
	elseif resultShowAdvancedByDefault=="0" then addRemoveToolbarElements.removeUserFieldsToolbarElements()  end
 	
	local pat = lpeg.P("showStylePalette") * lpeg.S(" \n\t") ^ 0 * lpeg.P("=") * lpeg.S(" \n\t") ^ 0 * lpeg.C(lpeg.R("09"))
	local pat = anywhere(pat)
	local resultShowStylePalette = lpeg.match(pat, t)
	if resultShowStylePalette=="1" then addRemoveToolbarElements.addUserFieldsStylePalette() 
	elseif resultShowStylePalette=="0" then addRemoveToolbarElements.removeUserFieldsStylePalette()  end
	
	-- local pat = lpeg.P("keepOriginalIsCompositionField") * lpeg.S(" \n\t") ^ 0 * lpeg.P("=") * lpeg.S(" \n\t") ^ 0 * lpeg.C(lpeg.R("09"))-------------
	-- local pat = anywhere(pat)-------------------------------------------------------------------------------------------------------------------------
	-- local resultKeepOriginalIsCompositionField = lpeg.match(pat, t)-----------------------------------------------------------------------------------
	
	--klases
	lQuery.model.add_class("AA#Profile")
	lQuery.model.add_class("AA#View")
	lQuery.model.add_class("AA#Field")
	lQuery.model.add_class("AA#RowType")
	lQuery.model.add_class("AA#Dependency")
	lQuery.model.add_class("AA#ChoiceItem")
	lQuery.model.add_class("AA#TransletTask")
	lQuery.model.add_class("AA#ContextType")
	lQuery.model.add_class("AA#Translet")
	lQuery.model.add_class("AA#Tag")
	lQuery.model.add_class("AA#StyleSetting")
	lQuery.model.add_class("AA#FieldStyleSetting")
	lQuery.model.add_class("AA#ViewStyleSetting")
	lQuery.model.add_class("AA#CustomStyleSetting")
	lQuery.model.add_class("AA#CompartStyleItem")
	lQuery.model.add_class("AA#ElemStyleItem")
	lQuery.model.add_class("AA#NodeStyleItem")
	lQuery.model.add_class("AA#EdgeStyleItem")
	lQuery.model.add_class("AA#AnyElemStyleItem")
	lQuery.model.add_class("AA#Configuration")
	lQuery.model.add_class("AA#TagType")
	
	--atributi
	lQuery.model.add_property("AA#Profile", "name")
	lQuery.model.add_property("AA#Profile", "isDefaultForViews")
	lQuery.model.add_property("AA#Profile", "tagTabName")
	
	lQuery.model.add_property("AA#Field", "name")
	lQuery.model.add_property("AA#Field", "defaultValue")
	lQuery.model.add_property("AA#Field", "prefix")
	lQuery.model.add_property("AA#Field", "suffix")
	lQuery.model.add_property("AA#Field", "delimiter")
	lQuery.model.add_property("AA#Field", "pattern")
	lQuery.model.add_property("AA#Field", "isStereotypeField")
	lQuery.model.add_property("AA#Field", "displayPlaceBefore")
	lQuery.model.add_property("AA#Field", "propertyEditorTab")
	lQuery.model.add_property("AA#Field", "propertyEditorPlaceBefore")
	lQuery.model.add_property("AA#Field", "fieldType")
	lQuery.model.add_property("AA#Field", "isExistingField")
	
	lQuery.model.add_property("AA#RowType", "typeName")
	
	lQuery.model.add_property("AA#ChoiceItem", "caption")
	lQuery.model.add_property("AA#ChoiceItem", "notation")
	
	lQuery.model.add_property("AA#TransletTask", "taskName")
	
	lQuery.model.add_property("AA#ContextType", "nr")
	lQuery.model.add_property("AA#ContextType", "type")
	lQuery.model.add_property("AA#ContextType", "elTypeName")
	lQuery.model.add_property("AA#ContextType", "path")
	lQuery.model.add_property("AA#ContextType", "mode")
	lQuery.model.add_property("AA#ContextType", "hasMirror")
	lQuery.model.add_property("AA#ContextType", "id")
	
	lQuery.model.add_property("AA#Translet", "procedure")
	
	lQuery.model.add_property("AA#TagType", "key")
	lQuery.model.add_property("AA#TagType", "notation")
	lQuery.model.add_property("AA#TagType", "rowType")
	
	lQuery.model.add_property("AA#Tag", "tagValue")
	lQuery.model.add_property("AA#Tag", "tagKey")
	
	lQuery.model.add_property("AA#StyleSetting", "value")
	lQuery.model.add_property("AA#StyleSetting", "target")
	lQuery.model.add_property("AA#StyleSetting", "isElementStyleSetting")
	lQuery.model.add_property("AA#StyleSetting", "path")
	lQuery.model.add_property("AA#StyleSetting", "procSetValue")
	
	lQuery.model.add_property("AA#ViewStyleSetting", "elementTypeName")
	lQuery.model.add_property("AA#ViewStyleSetting", "conditionCompartType")
	lQuery.model.add_property("AA#ViewStyleSetting", "conditionChoiceItem")
	lQuery.model.add_property("AA#ViewStyleSetting", "addMirror")
	
	lQuery.model.add_property("AA#CustomStyleSetting", "elementTypeName")
	lQuery.model.add_property("AA#CustomStyleSetting", "compartTypeName")
	lQuery.model.add_property("AA#CustomStyleSetting", "parameterName")
	lQuery.model.add_property("AA#CustomStyleSetting", "parameterValue")
	
	lQuery.model.add_property("AA#View", "name")
	lQuery.model.add_property("AA#View", "isDefault")
	lQuery.model.add_property("AA#View", "activeIcon")
	lQuery.model.add_property("AA#View", "inActiveIcon")
	lQuery.model.add_property("AA#View", "showInPalette")
	lQuery.model.add_property("AA#View", "showInToolBar")
	
	lQuery.model.add_property("AA#CompartStyleItem", "itemName")
	lQuery.model.add_property("AA#CompartStyleItem", "itemType")
	lQuery.model.add_property("AA#CompartStyleItem", "forNodeCompart")
	lQuery.model.add_property("AA#CompartStyleItem", "forEdgeCompart")
	lQuery.model.add_property("AA#CompartStyleItem", "forAttribCompart")
	lQuery.model.add_property("AA#CompartStyleItem", "isStyleItem")

	lQuery.model.add_property("AA#ElemStyleItem", "itemName")
	lQuery.model.add_property("AA#ElemStyleItem", "itemType")
	
	--linki
	lQuery.model.add_link("AA#Field", "fieldInContext", "context", "AA#ContextType")
	lQuery.model.add_link("AA#Field", "field", "fieldType", "AA#RowType")
	lQuery.model.add_link("AA#Field", "dependent", "dependency", "AA#Dependency")
	
	lQuery.model.add_link("AA#ChoiceItem", "dependsOn", "dependency", "AA#Dependency")
	
	lQuery.model.add_link("AA#Translet", "translet", "task", "AA#TransletTask")
	
	lQuery.model.add_link("AA#Field", "subField", "superField", "AA#Field")
	
	lQuery.model.add_link("AA#ElemStyleItem", "elemStyleFeature", "styleSetting", "AA#StyleSetting")
	lQuery.model.add_link("AA#CompartStyleItem", "fieldStyleFeature", "styleSetting", "AA#StyleSetting")
	
	lQuery.model.add_link("AA#ContextType", "context", "profile", "AA#Profile")
	lQuery.model.add_link("AA#TagType", "tagType", "profile", "AA#Profile")
	lQuery.model.add_link("AA#Configuration", "configuration", "profile", "AA#Profile")
	
	--kompozicijas
	lQuery.model.add_composition("AA#Field", "field", "profile", "AA#Profile")
	lQuery.model.add_composition("AA#View", "view", "profile", "AA#Profile")
	lQuery.model.add_composition("AA#ViewStyleSetting", "styleSetting", "view", "AA#View")
	lQuery.model.add_composition("AA#CustomStyleSetting", "customStyleSetting", "viewStyleSetting", "AA#ViewStyleSetting")
	lQuery.model.add_composition("AA#ChoiceItem", "choiceItem", "field", "AA#Field")
	lQuery.model.add_composition("AA#Field", "subField", "superField", "AA#Field")
	lQuery.model.add_composition("AA#Translet", "translet", "field", "AA#Field")
	lQuery.model.add_composition("AA#Tag", "tag", "field", "AA#Field")
	lQuery.model.add_composition("AA#Tag", "tag", "choiceItem", "AA#ChoiceItem")
	lQuery.model.add_composition("AA#Tag", "tag", "profile", "AA#Profile")
	lQuery.model.add_composition("AA#FieldStyleSetting", "selfStyleSetting", "field", "AA#Field")
	lQuery.model.add_composition("AA#FieldStyleSetting", "styleSetting", "choiceItem", "AA#ChoiceItem")
	lQuery.model.add_composition("AA#ContextType", "context", "configuration", "AA#Configuration")
	lQuery.model.add_composition("AA#TagType", "tagType", "configuration", "AA#Configuration")
	
	--virsklases
	lQuery.model.set_super_class("AA#FieldStyleSetting", "AA#StyleSetting")
	lQuery.model.set_super_class("AA#ViewStyleSetting", "AA#StyleSetting")
	lQuery.model.set_super_class("AA#CustomStyleSetting", "AA#StyleSetting")
	lQuery.model.set_super_class("AA#NodeStyleItem", "AA#ElemStyleItem")
	lQuery.model.set_super_class("AA#EdgeStyleItem", "AA#ElemStyleItem")
	lQuery.model.set_super_class("AA#AnyElemStyleItem", "AA#ElemStyleItem")
	
	lQuery.create("AA#Configuration")

	--------------------------------------------------------------------------------------------------------------------------------------
	-- lQuery.create("AA#ContextType", {
							-- nr = 01
							-- ,type = "Class"
							-- ,mode = "Element"
							-- ,id = "Class"
							-- }):link("configuration", lQuery("AA#Configuration"))
	-- lQuery.create("AA#ContextType", {
							-- nr = 02
							-- ,type = "Role"
							-- ,elTypeName = "Association"
							-- ,mode = "Group"
							-- ,hasMirror = 1
							-- ,id = "Association/Role"
							-- }):link("configuration", lQuery("AA#Configuration"))
	-- lQuery.create("AA#ContextType", {
							-- nr = 03
							-- ,type = "Attributes"
							-- ,elTypeName = "Class"
							-- ,mode = "Group Item"
							-- ,id = "Class/Attributes"
							-- }):link("configuration", lQuery("AA#Configuration"))
	-- lQuery.create("AA#ContextType", {
							-- nr = 04
							-- ,type = "Object"
							-- ,mode = "Element"
							-- ,id = "Object"
							-- }):link("configuration", lQuery("AA#Configuration"))
	-----------------------------------------------------------------------------------------------------------------------------------				
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
							
	----------------------------------------------------------------------------------------
	-- lQuery.create("AA#RowType", {
							-- typeName = "InputField"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "InputField+Button"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "CheckBox"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "ComboBox"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "ListBox"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "TextArea"})
	-- lQuery.create("AA#RowType", {
							-- typeName = "TextArea+Button"})
	-- lQuery.create("AA#RowType", {
							-- typeName = ""})
	-----------------------------------------------------------------------------------------

	lQuery.create("AA#CompartStyleItem", {itemName = 'isVisible', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'adjustment', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'alignment', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'adornment', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'textDirection', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontTypeFace', itemType = 'string', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontStyleBold', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontStyleItalic', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontStyleStrikeout', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontStyleUnderline', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontSize', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontColor', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontPitch', itemType = 'integer', forNodeCompart = '0', forEdgeCompart = '0', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'fontCharSet', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'lineWidth', itemType = 'integer', forNodeCompart = '0', forEdgeCompart = '0', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'lineColor', itemType = 'integer', forNodeCompart = '0', forEdgeCompart = '0', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'picture', itemType = 'string', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'picStyle', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'picWidth', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'picHeight', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'picPos', itemType = 'integer', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'prefix-inside', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'prefix-outside', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'prefix-inPlace', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'suffix-inside', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'suffix-outside', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'suffix-inPlace', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '1'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'compactVisible', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	lQuery.create("AA#CompartStyleItem", {itemName = 'breakAtSpace', itemType = 'boolean', forNodeCompart = '1', forEdgeCompart = '1', forAttribCompart = '0'})
	
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeCode', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'lineWidth', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'dashLength', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'breakLength', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'lineColor', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'bkgColor', itemType = 'integer'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyleShadow', itemType = 'boolean'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyle3D', itemType = 'boolean'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyleMultiple', itemType = 'boolean'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyleNoBorder', itemType = 'boolean'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyleNoBackground', itemType = 'boolean'})
	lQuery.create("AA#AnyElemStyleItem", {itemName = 'shapeStyleNotLinePen', itemType = 'boolean'})
	
	lQuery.create("AA#NodeStyleItem", {itemName = 'alignment', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'picture', itemType = 'string'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'picStyle', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'picPos', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'picWidth', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'picHeight', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'width', itemType = 'integer'})
	lQuery.create("AA#NodeStyleItem", {itemName = 'height', itemType = 'integer'})
	
	lQuery.create("AA#EdgeStyleItem", {itemName = 'lineType', itemType = 'string'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'lineDirection', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'lineStartDirection', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'lineEndDirection', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startShapeCode', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startLineWidth', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startTotalWidth', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startTotalHeight', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startLineColor', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'startBkgColor', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endShapeCode', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endLineWidth', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endTotalWidth', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endTotalHeight', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endLineColor', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'endBkgColor', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleShapeCode', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleLineWidth', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleDashLength', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleBreakLength', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleLineColor', itemType = 'integer'})
	lQuery.create("AA#EdgeStyleItem", {itemName = 'middleBkgColor', itemType = 'integer'})
	
	lQuery.model.add_class("ElementStyleSetting")
	lQuery.model.add_class("CompartmentStyleSetting")
	lQuery.model.add_class("SettingTag")
	
	lQuery.model.add_property("ElementStyleSetting", "setting")
	lQuery.model.add_property("ElementStyleSetting", "value")
	lQuery.model.add_property("ElementStyleSetting", "procSetValue")
	lQuery.model.add_property("ElementStyleSetting", "procCondition")
	lQuery.model.add_property("ElementStyleSetting", "strength")
	lQuery.model.add_property("ElementStyleSetting", "isDeleted")
	
	lQuery.model.add_property("CompartmentStyleSetting", "setting")
	lQuery.model.add_property("CompartmentStyleSetting", "value")
	lQuery.model.add_property("CompartmentStyleSetting", "procSetValue")
	lQuery.model.add_property("CompartmentStyleSetting", "procCondition")
	lQuery.model.add_property("CompartmentStyleSetting", "strength")
	lQuery.model.add_property("CompartmentStyleSetting", "isDeleted")
	lQuery.model.add_property("CompartmentStyleSetting", "settingMode")
	
	lQuery.model.add_property("SettingTag", "tagName")
	lQuery.model.add_property("SettingTag", "tagValue")
	
	lQuery.model.add_link("ElementStyleSetting", "elementStyleSetting", "elemType", "ElemType")
	lQuery.model.add_link("ElementStyleSetting", "elementStyleSetting", "choiceItem", "ChoiceItem")
	lQuery.model.add_link("ElementStyleSetting", "elementStyleSetting", "extension", "Extension")
	
	lQuery.model.add_link("CompartmentStyleSetting", "compartmentStyleSetting", "compartType", "CompartType")
	lQuery.model.add_link("CompartmentStyleSetting", "compartmentStyleSetting", "choiceItem", "ChoiceItem")
	lQuery.model.add_link("CompartmentStyleSetting", "compartmentStyleSetting", "extension", "Extension")
	
	lQuery.model.add_link("ElementStyleSetting", "dependingElementStyleSetting", "dependsOnCompartType", "CompartType")
	lQuery.model.add_link("CompartmentStyleSetting", "dependingCompartmentStyleSetting", "dependsOnCompartType", "CompartType")
	
	lQuery.model.add_link("SettingTag", "settingTag", "elementStyleSetting", "ElementStyleSetting")
	lQuery.model.add_link("SettingTag", "settingTag", "compartmentStyleSetting", "CompartmentStyleSetting")
	lQuery.model.add_link("SettingTag", "settingTag", "ref", "Thing")

	
	lQuery.create("AA#TagType", {key = "owl_Field_axiom", notation = "Semantics", rowType = "TextArea+Button"}):link("configuration", lQuery("AA#Configuration"))
	lQuery.create("AA#TagType", {key = "owl_Axiom_Annotation", notation = "Axiom Annotation", rowType = "TextArea"}):link("configuration", lQuery("AA#Configuration"))
	
	-----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- --paslepjam IsComposition
	-- if resultKeepOriginalIsCompositionField=="0" then----------------------------------------------------------------------------------------------------------
		-- lQuery("CompartType[caption='IsComposition']"):attr("shouldBeIncluded", "OWLGrEd_UserFields.owl_fields_specific.hide_for_OWL_Fields")------------------
		-- lQuery("CompartType[caption='IsComposition']/propertyRow"):attr("shouldBeIncluded", "OWLGrEd_UserFields.owl_fields_specific.hide_for_OWL_Fields")------
		-- lQuery("Compartment:has(/compartType[caption='IsComposition'])"):delete()------------------------------------------------------------------------------
		-- lQuery("GraphDiagram:has(/graphDiagramType[id='OWL'])"):each(function(diagram)-------------------------------------------------------------------------
			-- local cmd = lQuery.create("OkCmd")-----------------------------------------------------------------------------------------------------------------
			-- cmd:link("graphDiagram", diagram)------------------------------------------------------------------------------------------------------------------
			-- utilities.execute_cmd_obj(cmd)---------------------------------------------------------------------------------------------------------------------
		-- end)---------------------------------------------------------------------------------------------------------------------------------------------------
	-- end--------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------
	lQuery.model.add_link("Extension", "aa#owner", "aa#subExtension", "Extension")
	lQuery.model.add_link("Extension", "activeExtension", "graphDiagram", "GraphDiagram")
	lQuery.model.add_link("Extension", "aa#notDefault", "aa#graphDiagram", "GraphDiagram")
	
	lQuery.model.add_link("Type", "axiomAnnotationType", "axiomAnnotationTag", "Tag")
	
	lQuery.create("Extension", {id="OWL_Fields", type="Plugin"})
	
	local compart = lQuery("CompartType"):filter(function(obj)
		return lQuery(obj):find("/choiceItem/elemStyleByChoiceItem"):size() > 0
	end)
	compart:each(function(obj)
		lQuery.create("Translet", {extensionPoint = 'procFieldEntered', procedureName = 'OWLGrEd_UserFields.owl_fields_specific.setStyleSetting'}):link("type", obj)
	end)
	compart = lQuery("CompartType"):filter(function(obj)
		return lQuery(obj):find("/choiceItem/compartStyleByChoiceItem"):size() > 0
	end)
	compart:each(function(obj)
		lQuery.create("Translet", {extensionPoint = 'procFieldEntered', procedureName = 'OWLGrEd_UserFields.owl_fields_specific.setStyleSetting'}):link("type", obj)
	end)
	
	--pievienojam tagus pie toolType prieks importa/eksporta
	-- lQuery.create("Tag", {value = "OWLGrEd_UserFields.axiom.axiom", key = "owlgred_export"}):link("type", lQuery("ToolType"))
	-- lQuery.create("Tag", {value = "owlFields:=<http://owlgred.lumii.lv/__plugins/fields/2011/1.0/owlgred#>", key = "owl_NamespaceDef"}):link("type", lQuery("ToolType"))
	-- lQuery.create("Tag", {key = "owl_Annotation_Import"}):link("type", lQuery("ToolType"))
	-- lQuery.create("Tag", {key = "owl_Import_Prefixes"}):link("type", lQuery("ToolType"))
	-- lQuery.create("Translet", {extensionPoint='RecalculateStylesInImport', procedureName='OWLGrEd_UserFields.owl_fields_specific.setImportStyles'}):link("type", lQuery("ToolType"))
	
	lQuery.model.add_link("CompartType", "aa#mirror", "aa#mirrorInv", "CompartType")
	
	--savienojam tiesos un inversos compartType
	-- local compartTypeRole = lQuery("ElemType[id='Association']/compartType[id='Role']/subCompartType"):each(function(ct)
		-- local compatTypeInv = lQuery("ElemType[id='Association']/compartType[id='InvRole']/subCompartType[id = '" .. ct:attr("id") .. "']"):link("aa#mirrorInv", ct)
	-- end)
	
	-- local compartTypeRole = lQuery("ElemType[id='Association']/compartType[id='Role']/subCompartType/subCompartType/subCompartType"):each(function(ct)
		-- local compatTypeInv = lQuery("ElemType[id='Association']/compartType[id='InvRole']/subCompartType/subCompartType/subCompartType[id = '" .. ct:attr("id") .. "']"):link("aa#mirrorInv", ct)
	-- end)

	-- local compartTypeLink = lQuery("ElemType[id='Link']/compartType[id='Direct']/subCompartType"):each(function(ct)
		-- local compatTypeInv = lQuery("ElemType[id='Link']/compartType[id='Inverse']/subCompartType[caption = '" .. ct:attr("caption") .. "']"):link("aa#mirrorInv", ct)
	-- end)
	
	-- lQuery("ElemType[id='Association']/compartType[id='Role']"):link("aa#mirror", lQuery("ElemType[id='Association']/compartType[id='InvRole']"))
	-- lQuery("ElemType[id='Link']/compartType[id='Direct']"):link("aa#mirror", lQuery("ElemType[id='Link']/compartType[id='Inverse']"))
	
	-- local dependentStylesTable = styleMechanism.dependentStylesTable()
	-- for i,v in pairs(dependentStylesTable) do
		-- local pathTable = styleMechanism.split(v[1], "/")
		-- local elem--lauks kuram ir translets
		-- for j,b in pairs(pathTable) do
			-- if j == 1 then elem = lQuery("ElemType[id='" .. b  .. "']")
			-- elseif j == 2 then elem = elem:find("/compartType[id='" .. b .. "']")
			-- else
				-- elem = elem:find("/subCompartType[id='" .. b .. "']")
			-- end
		-- end
		-- elem:find("/translet[extensionPoint='procFieldEntered']"):attr("procedureName", "OWLGrEd_UserFields.owl_fields_specific.setDependentStyleSetting")
	-- end
	 
	
	--importejam AA#ContextType
	local pathConfiguration = tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\user\\AutoLoadConfiguration"
	loudAutoLoudContextType(pathConfiguration)

	local pathContextType = tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\user\\AutoLoad"
	loudAutoLoudProfiles(pathContextType)
	
	-- lQuery("AA#View[showInToolBar='true']"):each(function(view)
		-- local owl_dgr_type = lQuery("GraphDiagramType[id=OWL]")
		-- local toolbarTypeOwl = owl_dgr_type:find("/toolbarType")
		-- if toolbarTypeOwl:is_empty() then
		  -- toolbarTypeOwl = lQuery.create("ToolbarType", {graphDiagramType = owl_dgr_type})
		-- end
		
		-- local view_manager_toolbar_el = lQuery.create("ToolbarElementType", {
		  -- toolbarType = toolbarTypeOwl,
		  -- id = view:id(),
		  -- caption = view:attr("name"),
		  -- picture = view:attr("inActiveIcon"),
		  -- procedureName = "OWLGrEd_UserFields.styleMechanism.applyViewFromToolBar"
		-- })	
	-- end)
	
	-- lQuery.create("PopUpElementType", {id="Style Palette", caption="Style Palette", nr=5, visibility=true, procedureName="OWLGrEd_UserFields.stylePalette.stylePaletteOWL"})
		-- :link("popUpDiagramType", lQuery("GraphDiagramType[id='OWL']/rClickEmpty"))
	
	lQuery.create("PopUpElementType", {id="Style Palette", caption="Style Palette", nr=5, visibility=true, procedureName="OWLGrEd_UserFields.stylePalette.stylePaletteProgect"})
		:link("popUpDiagramType", lQuery("GraphDiagramType[id='projectDiagram']/rClickEmpty"))
	
	--print("compele ENDED")	projectDiagram
end

function loudAutoLoudContextType(pathConfiguration)
	local fileTableConfiguration = syncProfile.attrdir(pathConfiguration)
	for i,v in pairs(fileTableConfiguration) do
		serialize.import_from_file(v)
		local configuration = lQuery("AA#Configuration"):first()
		lQuery("AA#ContextType"):each(function(obj)
			obj:remove_link("configuration", obj:find("/configuration"))
		end)
		lQuery("AA#ContextType"):link("configuration", configuration)
		
		lQuery("AA#TagType"):each(function(obj)
			obj:remove_link("configuration", obj:find("/configuration"))
		end)
		lQuery("AA#TagType"):link("configuration", configuration)
		
		lQuery("AA#Configuration"):filter(function(obj)
			return obj:id() ~= configuration:id()
		end):delete()
		
		lQuery("AA#Profile"):remove_link("configuration", lQuery("AA#Profile/configuration"))
		lQuery("AA#Profile"):link("configuration", lQuery("AA#Configuration"))
		
		-- izmest dublikatus
		 -- atrast visus AA#ContextType
		 -- iziet cauri visiem. Ja ir vairki ar viendu id, tad izdzest to, kam nav AA#Field
		lQuery("AA#ContextType"):each(function(obj)
			local id = obj:attr("id")
			local eq = lQuery("AA#ContextType[id = '" .. id .."']")
			if eq:size()>1 then
				if obj:find("/fieldInContext"):is_empty() then 
					obj:delete()
				else
					eq:filter(function(ct)
						return ct:attr("id") ~= obj:attr("id")
					end):delete()
				end
			end
		end)
		
		lQuery("AA#TagType"):each(function(obj)
			local tt = lQuery("AA#TagType[key='" .. obj:attr("key") .. "'][notation='" .. obj:attr("notation") .. "'][rowType='" .. obj:attr("rowType") .. "']")
			if tt:size()>1 then obj:delete() end
		end)
	end
end

function loudAutoLoudProfiles(pathContextType)
	--local pathContextType = tda.GetProjectPath() .. "\\Plugins\\OWLGrEd_UserFields\\user\\AutoLoad"
	local fileTable = syncProfile.attrdir(pathContextType)
	for i,v in pairs(fileTable) do
		serialize.import_from_file(v)
		--jaatrod profila vards
		--jaatrod tas profils, kam nav saderibas
		local profileName
		lQuery("AA#Profile"):each(function(obj)
			if lQuery("Extension[id='" .. obj:attr("name") .. "'][type='aa#Profile']"):is_empty() then 
				profileName = obj:attr("name")
			end
		end)
		
		if profileName~=nil then
		
			lQuery("AA#Profile[name='" .. profileName .. "']"):link("configuration", lQuery("AA#Configuration"))
			
			local ext = lQuery.create("Extension", {id = profileName, type = "aa#Profile"})--:link("aa#owner", lQuery("Extension[id = 'OWL_Fields']"))
			lQuery("Extension[id = 'OWL_Fields']"):link("aa#subExtension", ext)
			lQuery("AA#Profile[name='" .. profileName .. "']/view"):each(function(obj)
				--obj:link("configuration", lQuery("AA#Configuration"))
				if ext:find("/aa#subExtension[id='" .. obj:attr("name") .. "'][type='aa#View']"):is_empty() then
					lQuery.create("Extension", {id=obj:attr("name"), type="aa#View"}):link("aa#owner", ext)
					:link("aa#graphDiagram", lQuery("GraphDiagram:has(/graphDiagramType[id='OWL'])"))
				end
			end)
			
			--ja ir saite uz AA#RowType, nonemam tas
			lQuery("AA#Field"):each(function(obj)
			local fieldType = obj:find("/fieldType")
				if fieldType:is_not_empty() then
					obj:attr("fieldType", fieldType:attr("typeName"))
					fieldType:remove_link("field", obj)
				end
			end)
			
			syncProfile.syncProfile(profileName)
			styleMechanism.syncExtensionViews()
		end
	end
end


function anywhere (p)
  return lpeg.P{ p + 1 * lpeg.V(1) }
end
