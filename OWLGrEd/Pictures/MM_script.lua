c = require("configurator.configurator")

local var_2000001725 = lQuery.create("GraphDiagramType", { 
	screenZoom = 1000,
	layoutAlgorithm = 3,
	procDynamicPopUpE = "configurator.const.const_utilities.add_project_diagram_pop_up",
	bkgColor = 16775408,
	id = "projectDiagram",
	printZoom = 1000,
	isNew = "true",
	layoutMode = 0
})
local var_2000001726 = lQuery.create("PopUpDiagram", { 
	id = "collection"
})
local var_2000001727 = lQuery.create("PopUpElement", { 
	nr = 2,
	id = "Cut		Ctrl+X",
	caption = "Cut		Ctrl+X",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001728 = lQuery.create("PopUpElement", { 
	nr = 3,
	id = "Copy		Ctrl+C",
	caption = "Copy		Ctrl+C",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001729 = lQuery.create("PopUpElement", { 
	nr = 4,
	id = "Delete	Delete",
	caption = "Delete	Delete",
	visibility = "true",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001730 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl V",
	procedure_name = "interpreter.CutCopyPaste.Paste"
})
local var_2000001731 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl X",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001732 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl C",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001733 = lQuery.create("KeyboardShortcut", { 
	key = "Delete",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001734 = lQuery.create("KeyboardShortcut", { 
	key = "Enter",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000001735 = lQuery.create("Palette", { 
	
})
local var_2000001736 = lQuery.create("NodeType", { 
	id = "Box25",
	procCopied = "interpreter.CutCopyPaste.copy_paste_diagram_seed",
	procPasted = "interpreter.CutCopyPaste.copy_paste_diagram_seed",
	openPropertiesOnElementCreate = "true",
	procCreateElementDomain = "configurator.const.const_utilities.add_navigation_diagram",
	isContainerMandatory = "false",
	caption = "Box25",
	l2ClickEvent = "utilities.navigate",
	procDeleteElement = "interpreter.Delete.delete_seed",
	procProperties = "interpreter.Properties.Properties"
})
local var_2000002465 = lQuery.create("PopUpDiagram", { 
	
})
local var_2000002466 = lQuery.create("PopUpElement", { 
	nr = 1,
	id = "Properties	Enter",
	caption = "Properties	Enter",
	visibility = "true",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000002467 = lQuery.create("PopUpElement", { 
	nr = 2,
	id = "Cut		Ctrl+X",
	caption = "Cut		Ctrl+X",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000002468 = lQuery.create("PopUpElement", { 
	nr = 3,
	id = "Copy		Ctrl+C",
	caption = "Copy		Ctrl+C",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000002469 = lQuery.create("PopUpElement", { 
	nr = 4,
	id = "Delete	Delete",
	caption = "Delete	Delete",
	visibility = "true",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001742 = lQuery.create("NodeStyle", { 
	lineWidth = 1,
	shapeStyle = 0,
	lineColor = 0,
	picPos = 1,
	id = "Box",
	bkgColor = 255,
	breakLength = 0,
	width = 110,
	dashLength = 0,
	picStyle = 0,
	alignment = 0,
	shapeCode = 1,
	height = 45,
	caption = "Box",
	picWidth = 0,
	picHeight = 0
})
local var_2000001743 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl X",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001744 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl C",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001745 = lQuery.create("KeyboardShortcut", { 
	key = "Delete",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001746 = lQuery.create("KeyboardShortcut", { 
	key = "Enter",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000001747 = lQuery.create("CompartType", { 
	pattern = "a-zA-Z0-9-_ ",
	id = "Name11",
	isEssential = "true",
	caption = "Name11",
	procFieldEntered = "utilities.update_target_diagram_caption"
})
local var_2000001748 = lQuery.create("CompartStyle", { 
	lineWidth = 1,
	fontSize = 9,
	fontColor = 0,
	adornment = 0,
	fontTypeFace = "Arial",
	picStyle = 0,
	nr = 1,
	adjustment = 0,
	picWidth = 0,
	isVisible = 1,
	fontPitch = 0,
	picPos = 1,
	id = "Name11",
	lineColor = 0,
	alignment = 1,
	textDirection = 0,
	fontCharSet = -70,
	fontStyle = 0,
	caption = "Name11",
	picHeight = 0
})
local var_2000002472 = lQuery.create("CompartType", { 
	is_occurrence_compartment = "false",
	pattern = "a-zA-Z0-9-_",
	id = "NewAttribute2",
	isEssential = "true",
	isDiagramName = "false",
	isMultiple = "false",
	nr = 0,
	isHint = "false",
	caption = "NewAttribute2",
	isStereotypable = "false",
	isStereotype = "false",
	toBeInvisible = "false"
})
local var_2000002473 = lQuery.create("CompartStyle", { 
	lineWidth = 1,
	fontSize = 9,
	fontColor = 0,
	adornment = 0,
	fontTypeFace = "Arial",
	picStyle = 0,
	nr = 0,
	adjustment = 0,
	picWidth = 0,
	isVisible = 1,
	fontPitch = 0,
	picPos = 1,
	id = "NewAttribute2",
	lineColor = 0,
	alignment = 0,
	fontCharSet = 1,
	fontStyle = 0,
	caption = "NewAttribute2",
	picHeight = 0
})
local var_2000001749 = lQuery.create("PaletteBox", { 
	caption = "Box25",
	id = "Box25",
	nr = 1,
	picture = "0_line_false.bmp"
})
local var_2000001750 = lQuery.create("PropertyDiagram", { 
	id = "Box25"
})
local var_2000001751 = lQuery.create("PropertyRow", { 
	isReadOnly = "false",
	rowType = "ComboBox",
	isEditable = "true",
	isFirstRespondent = "false",
	id = "Name11"
})
local var_2000001752 = lQuery.create("GraphDiagramType", { 
	layoutAlgorithm = 3,
	bkgColor = 16775408,
	id = "Box25",
	printZoom = 1000,
	isNew = "true",
	layoutMode = 0,
	caption = "Box25",
	procDynamicPopUpE = "configurator.const.const_utilities.add_default_diagram_pop_up",
	screenZoom = 1000
})
local var_2000001753 = lQuery.create("PopUpDiagram", { 
	id = "collection"
})
local var_2000001754 = lQuery.create("PopUpElement", { 
	nr = 2,
	id = "Cut		Ctrl+X",
	caption = "Cut		Ctrl+X",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001755 = lQuery.create("PopUpElement", { 
	nr = 3,
	id = "Copy		Ctrl+C",
	caption = "Copy		Ctrl+C",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001756 = lQuery.create("PopUpElement", { 
	nr = 4,
	id = "Delete	Delete",
	caption = "Delete	Delete",
	visibility = "true",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001757 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl V",
	procedure_name = "interpreter.CutCopyPaste.Paste"
})
local var_2000001758 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl X",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001759 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl C",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001760 = lQuery.create("KeyboardShortcut", { 
	key = "Delete",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001761 = lQuery.create("KeyboardShortcut", { 
	key = "Enter",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000001762 = lQuery.create("NodeType", { 
	id = "Box33",
	procCopied = "interpreter.CutCopyPaste.copy_paste_diagram_seed",
	procPasted = "interpreter.CutCopyPaste.copy_paste_diagram_seed",
	openPropertiesOnElementCreate = "true",
	procCreateElementDomain = "configurator.const.const_utilities.add_navigation_diagram",
	isContainerMandatory = "false",
	caption = "Box21",
	l2ClickEvent = "utilities.navigate",
	procDeleteElement = "interpreter.Delete.delete_seed",
	procProperties = "interpreter.Properties.Properties"
})
local var_2000002860 = lQuery.create("PopUpDiagram", { 
	
})
local var_2000002861 = lQuery.create("PopUpElement", { 
	nr = 1,
	id = "Properties	Enter",
	caption = "Properties	Enter",
	visibility = "true",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000002862 = lQuery.create("PopUpElement", { 
	nr = 2,
	id = "Cut		Ctrl+X",
	caption = "Cut		Ctrl+X",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000002863 = lQuery.create("PopUpElement", { 
	nr = 3,
	id = "Copy		Ctrl+C",
	caption = "Copy		Ctrl+C",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000002864 = lQuery.create("PopUpElement", { 
	nr = 4,
	id = "Delete	Delete",
	caption = "Delete	Delete",
	visibility = "true",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001768 = lQuery.create("NodeStyle", { 
	lineWidth = 1,
	shapeStyle = 0,
	lineColor = 0,
	picPos = 1,
	id = "Box",
	bkgColor = 65280,
	breakLength = 0,
	width = 110,
	dashLength = 0,
	picStyle = 0,
	alignment = 0,
	shapeCode = 1,
	height = 45,
	caption = "Box",
	picWidth = 0,
	picHeight = 0
})
local var_2000001769 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl X",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001770 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl C",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001771 = lQuery.create("KeyboardShortcut", { 
	key = "Delete",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001772 = lQuery.create("KeyboardShortcut", { 
	key = "Enter",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000001775 = lQuery.create("PaletteBox", { 
	caption = "Box",
	id = "Box",
	nr = 2,
	picture = "1asdDataElement.bmp"
})
local var_2000001778 = lQuery.create("GraphDiagramType", { 
	layoutAlgorithm = 3,
	bkgColor = 16775408,
	id = "Box21",
	printZoom = 1000,
	isNew = "true",
	layoutMode = 0,
	caption = "Box21",
	procDynamicPopUpE = "configurator.const.const_utilities.add_default_diagram_pop_up",
	screenZoom = 1000
})
local var_2000001779 = lQuery.create("PopUpDiagram", { 
	id = "collection"
})
local var_2000001780 = lQuery.create("PopUpElement", { 
	nr = 2,
	id = "Cut		Ctrl+X",
	caption = "Cut		Ctrl+X",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001781 = lQuery.create("PopUpElement", { 
	nr = 3,
	id = "Copy		Ctrl+C",
	caption = "Copy		Ctrl+C",
	visibility = "true",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001782 = lQuery.create("PopUpElement", { 
	nr = 4,
	id = "Delete	Delete",
	caption = "Delete	Delete",
	visibility = "true",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001783 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl V",
	procedure_name = "interpreter.CutCopyPaste.Paste"
})
local var_2000001784 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl X",
	procedure_name = "interpreter.CutCopyPaste.Cut"
})
local var_2000001785 = lQuery.create("KeyboardShortcut", { 
	key = "Ctrl C",
	procedure_name = "interpreter.CutCopyPaste.Copy"
})
local var_2000001786 = lQuery.create("KeyboardShortcut", { 
	key = "Delete",
	procedure_name = "interpreter.Delete.Delete"
})
local var_2000001787 = lQuery.create("KeyboardShortcut", { 
	key = "Enter",
	procedure_name = "interpreter.Properties.Properties"
})
local var_2000001788 = lQuery.create("GraphDiagram", { 
	layoutAlgorithm = 3,
	bkgColor = 16775408,
	screenZoom = 1000,
	printZoom = 1000,
	collapsed = "E",
	layoutMode = 0
})
var_2000001788:link("graphDiagramType", lQuery("GraphDiagramType[id = specificationDgr]"))
local var_2000001789 = lQuery.create("Node", { 
	style = "[[1;0;1;0;0;0;255;0;][;]]",
	location = "110;45;119;89;110;45;0;"
})
var_2000001789:link("elemType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"))
local var_2000001790 = lQuery.create("GraphDiagram", { 
	layoutAlgorithm = 3,
	bkgColor = 16775408,
	caption = "Box25",
	printZoom = 1000,
	screenZoom = 1000,
	layoutMode = 0
})
var_2000001790:link("graphDiagramType", lQuery("GraphDiagramType[id = diagramTypeDiagram]"))
local var_2000001791 = lQuery.create("Compartment", { 
	input = "Box25",
	style = "[AS#Name;1;0;0;[1;0;1;0;0;1;16777215;0;]104;15;4;2;1;[-70;0;-12;0;0;Arial;][;]]",
	value = "Box25"
})
var_2000001791:link("compartStyle", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Name]"):find("/compartStyle[id = AS#Name]"))
var_2000001791:link("compartType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Name]"))
local var_2000001792 = lQuery.create("Compartment", { 
	input = "Name11",
	style = "[Name;1;0;0;[1;0;1;0;0;0;16777215;0;]104;15;4;17;1;[-70;0;-12;0;0;Arial;][;]]",
	value = "Name11"
})
var_2000001792:link("compartStyle", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Attributes]"))
var_2000001792:link("compartType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Attributes]"))
local var_2000002474 = lQuery.create("Compartment", { 
	input = "NewAttribute2",
	style = "[NewAttribute2;0;0;0;[1;0;1;0;0;0;16777215;0;]104;15;4;17;1;[-70;0;-12;0;0;Arial;][;]]",
	value = "NewAttribute2"
})
var_2000002474:link("compartStyle", lQuery("GraphDiagramType[id = projectDiagram]"):find("/elemType[id = Box25]"):find("/compartType[id = NewAttribute2]"):find("/compartStyle[id = NewAttribute2]"))
var_2000002474:link("compartType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Attributes]"))
local var_2000001793 = lQuery.create("Node", { 
	style = "[[1;0;1;0;0;0;65280;0;][;]]",
	location = "110;45;426;118;110;45;0;"
})
var_2000001793:link("elemType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"))
local var_2000001794 = lQuery.create("GraphDiagram", { 
	layoutAlgorithm = 3,
	bkgColor = 16775408,
	caption = "Box21",
	printZoom = 1000,
	screenZoom = 1000,
	layoutMode = 0
})
var_2000001794:link("graphDiagramType", lQuery("GraphDiagramType[id = diagramTypeDiagram]"))
local var_2000001795 = lQuery.create("Compartment", { 
	input = "Box21",
	style = "[AS#Name;1;0;0;[1;0;1;0;0;1;16777215;0;]104;15;4;2;1;[-70;0;-12;0;0;Arial;][;]]",
	value = "Box21"
})
var_2000001795:link("compartStyle", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Name]"):find("/compartStyle[id = AS#Name]"))
var_2000001795:link("compartType", lQuery("GraphDiagramType[id = specificationDgr]"):find("/elemType[id = Box]"):find("/compartType[id = AS#Name]"))
var_2000001725:link("RClickCollection", var_2000001726)
var_2000001726:link("popUpElement", var_2000001727)
var_2000001726:link("popUpElement", var_2000001728)
var_2000001726:link("popUpElement", var_2000001729)
var_2000001725:link("eKeyboardShortcut", var_2000001730)
var_2000001725:link("cKeyboardShortcut", var_2000001731)
var_2000001725:link("cKeyboardShortcut", var_2000001732)
var_2000001725:link("cKeyboardShortcut", var_2000001733)
var_2000001725:link("cKeyboardShortcut", var_2000001734)
var_2000001725:link("palette", var_2000001735)
var_2000001736:link("popUpDiagram", var_2000002465)
var_2000002465:link("popUpElement", var_2000002466)
var_2000002465:link("popUpElement", var_2000002467)
var_2000002465:link("popUpElement", var_2000002468)
var_2000002465:link("popUpElement", var_2000002469)
var_2000001736:link("elemStyle", var_2000001742)
var_2000001736:link("keyboardShortcut", var_2000001743)
var_2000001736:link("keyboardShortcut", var_2000001744)
var_2000001736:link("keyboardShortcut", var_2000001745)
var_2000001736:link("keyboardShortcut", var_2000001746)
var_2000001736:link("compartType", var_2000001747)
var_2000001747:link("compartStyle", var_2000001748)
var_2000001736:link("compartType", var_2000002472)
var_2000002472:link("compartStyle", var_2000002473)
var_2000001736:link("paletteElement", var_2000001749)
var_2000001749:link("palette", var_2000001735)
var_2000001736:link("propertyDiagram", var_2000001750)
var_2000001750:link("propertyRow", var_2000001751)
var_2000001751:link("compartType", var_2000001747)
var_2000001725:link("elemType", var_2000001736)
var_2000001736:link("target", var_2000001752)
var_2000001752:link("RClickCollection", var_2000001753)
var_2000001753:link("popUpElement", var_2000001754)
var_2000001753:link("popUpElement", var_2000001755)
var_2000001753:link("popUpElement", var_2000001756)
var_2000001752:link("eKeyboardShortcut", var_2000001757)
var_2000001752:link("cKeyboardShortcut", var_2000001758)
var_2000001752:link("cKeyboardShortcut", var_2000001759)
var_2000001752:link("cKeyboardShortcut", var_2000001760)
var_2000001752:link("cKeyboardShortcut", var_2000001761)
var_2000001762:link("popUpDiagram", var_2000002860)
var_2000002860:link("popUpElement", var_2000002861)
var_2000002860:link("popUpElement", var_2000002862)
var_2000002860:link("popUpElement", var_2000002863)
var_2000002860:link("popUpElement", var_2000002864)
var_2000001762:link("elemStyle", var_2000001768)
var_2000001762:link("keyboardShortcut", var_2000001769)
var_2000001762:link("keyboardShortcut", var_2000001770)
var_2000001762:link("keyboardShortcut", var_2000001771)
var_2000001762:link("keyboardShortcut", var_2000001772)
var_2000001762:link("paletteElement", var_2000001775)
var_2000001775:link("palette", var_2000001735)
var_2000001725:link("elemType", var_2000001762)
var_2000001762:link("target", var_2000001778)
var_2000001778:link("RClickCollection", var_2000001779)
var_2000001779:link("popUpElement", var_2000001780)
var_2000001779:link("popUpElement", var_2000001781)
var_2000001779:link("popUpElement", var_2000001782)
var_2000001778:link("eKeyboardShortcut", var_2000001783)
var_2000001778:link("cKeyboardShortcut", var_2000001784)
var_2000001778:link("cKeyboardShortcut", var_2000001785)
var_2000001778:link("cKeyboardShortcut", var_2000001786)
var_2000001778:link("cKeyboardShortcut", var_2000001787)
var_2000001788:link("target_type", var_2000001725)
var_2000001788:link("element", var_2000001789)
var_2000001789:link("target_type", var_2000001736)
var_2000001789:link("elemStyle", var_2000001742)
var_2000001789:link("target", var_2000001790)
var_2000001790:link("target_type", var_2000001752)
var_2000001789:link("compartment", var_2000001791)
var_2000001789:link("compartment", var_2000001792)
var_2000001792:link("target_type", var_2000001747)
var_2000001789:link("compartment", var_2000002474)
var_2000002474:link("target_type", var_2000002472)
var_2000001788:link("element", var_2000001793)
var_2000001793:link("target_type", var_2000001762)
var_2000001793:link("elemStyle", var_2000001768)
var_2000001793:link("target", var_2000001794)
var_2000001794:link("target_type", var_2000001778)
var_2000001793:link("compartment", var_2000001795)


lQuery("GraphDiagramType[id = Box114]")
	:find("/elemType[id = Box]")
	:attr({id = "Box1"})
lQuery("GraphDiagramType[id = ]")
	:attr({id = "Boxy"})
lQuery("GraphDiagramType[id = projectDiagram]")
	:find("/elemType[id = Box]")
	:attr({id = "Boxy"})
lQuery("GraphDiagramType[id = Boxy]")
	:find("/elemType[id = Box]")
	:attr({id = "zzz"})
lQuery("GraphDiagramType[id = Boxy]")
	:find("/elemType[id = Box]")
	:attr({id = "kkk"})
lQuery("GraphDiagramType[id = Box113]")
	:attr({id = "Box1134"})
lQuery("GraphDiagramType[id = projectDiagram]")
	:find("/elemType[id = Box113]")
	:attr({id = "Box1134"})
lQuery("GraphDiagramType[id = ]")
	:attr({id = "Box2"})
lQuery("GraphDiagramType[id = Box]")
	:attr({id = "Box2"})
lQuery("GraphDiagramType[id = projectDiagram]")
	:find("/elemType[id = Box]")
	:attr({id = "Box2"})
lQuery("GraphDiagramType[id = projectDiagram]")
	:find("/elemType[id = Box]")
	:attr({id = "Box33"})
lQuery("GraphDiagramType[id = Box2]")
	:attr({id = "Box21"})
lQuery("GraphDiagramType[id = projectDiagram]")
	:find("/elemType[id = Box2]")
	:attr({id = "Box25"})
lQuery("GraphDiagramType[id = Box2]")
	:attr({id = "Box25"})

--migration


function process_elem_types(old_diagram_type, new_diagram_type)
	print("process elem types")
	local elem_type_list = {}
	new_diagram_type:find("/elemType"):each(function(elem_type)
		table.insert(elem_type_list, elem_type:attr("id"))
	end)
	for _, id in ipairs(elem_type_list) do
		local new_elem_type = new_diagram_type:find("/elemType[id = " .. id .. "]")
		local old_elem_type = old_diagram_type:find("/elemType[id = " .. id .. "]")
		local elems = old_elem_type:find("/element")
		old_elem_type:remove_link("element")
		new_elem_type:link("element", elems)
		set_obj_style(elems, "elemStyle", new_elem_type)
		
		process_compart_type(old_elem_type, new_elem_type)

		local old_target_diagram_type = old_elem_type:find("/target")
		if old_target_diagram_type:size() > 0 then
			print("old target diagram type")
			process_elem_types(old_target_diagram_type, new_elem_type:find("/target"))
		
			local presentation_diagram = old_target_diagram_type:find("/presentation"):log()
			utilities.close_diagram(presentation_diagram)
			presentation_diagram:delete()


			--old_target_diagram_type:find("/graphDiagram"):delete()
			c.delete_diagram_type(old_target_diagram_type)
		end
		
	--vajag jau esosu funkciju, kas izdzes visu apkartni
		c.delete_elem_type(old_elem_type)
		--old_elem_type:delete()
	end
	old_diagram_type:find("/elemType"):each(function(old_elem_type)
		--old_elem_type:find("/element"):delete()
		c.delete_elem_type(old_elem_type)
		--old_elem_type:delete()
	end)
	print("end process elem types")
end

function set_obj_style(objects, role, new_obj_type)
	objects:each(function(obj)
		local obj_style = obj:find("/" .. role)
		local new_obj_style = new_obj_type:find("/" .. role .. "[id = " .. obj_style:attr("id") .. "]")
		if new_obj_style:size() == 0 then
			new_obj_style = new_obj_type:find("/" .. role .. "[id = " .. new_obj_type:attr("id") .. "]")
		end
		obj:remove_link(role)
		obj:link(role, new_obj_style)
	end)
end



function process_compart_type(old_elem_type, new_elem_type)
--no new uztaisa tabulu, tad apstaiga old un parvelk linkus
--dzesot compartType vajag izmantot jau esosu funkciju, jo ir jadzes visa apkartne
	print("process compart type")
	local compart_type_table = {}
	make_sub_compart_type_table(new_elem_type, "/compartType", compart_type_table)
	traverse_compart_type_table(old_elem_type, new_elem_type, compart_type_table, "/compartType")
	
	print("end process compart type")
	
	
	--print(dumptable(compart_type_table))

end

function traverse_compart_type_table(old_elem_type, new_elem_type, compart_type_table, role)
print("traverse compart type table")
	for index, val in pairs(compart_type_table) do
		local old_compart_type = old_elem_type:find(role .. "[id = " .. index .. "]")
		local new_compart_type = new_elem_type:find(role .. "[id = " .. index .. "]")
		local comparts = old_compart_type:find("/compartment")
		old_compart_type:remove_link("compartment")
		new_compart_type:link("compartment", comparts)
		
		set_obj_style(comparts, "compartStyle", new_compart_type)


		

		if type(val) == "table" then
			traverse_compart_type_table(old_compart_type, new_compart_type, val, "/subCompartType")
		end
	end
print("end traverse compart type table")
end

function make_sub_compart_type_table(base_obj_type, role, compart_type_table)
	base_obj_type:find(role):each(function(compart_type)
		local sub_compart_type = compart_type:find("/subCompartType")
		if sub_compart_type:is_empty() then	
			compart_type_table[compart_type:attr("id")] = compart_type:attr("id")
		else
			compart_type_table[compart_type:attr("id")] = {}
			local tmp_table = compart_type_table[compart_type:attr("id")]
			make_sub_compart_type_table(compart_type, "/subCompartType", tmp_table)
		end
	end)
end

local diagram_type_list = {}
table.insert(diagram_type_list, "projectDiagram")

for _, id in ipairs(diagram_type_list) do
	--lQuery("GraphDiagramType[id = '" .. id .. "']"):each(function(diagram_type_pair)
	
	local diagram_type_pair = lQuery("GraphDiagramType[id = '" .. id .. "']")
		print("in diagram type list")
		diagram_type_pair:log()

		print("new diagram type")
		local new_diagram_type = diagram_type_pair:filter("[isNew = true]"):log("id")
		print("old diagram type")
		local old_diagram_type = diagram_type_pair:filter(":not([isNew = true])"):log("id")
		local diagrams = old_diagram_type:find("/graphDiagram")
		old_diagram_type:remove_link("graphDiagram")
		new_diagram_type:link("graphDiagram", diagrams)
		process_elem_types(old_diagram_type, new_diagram_type)
		
		--vajag izdzest apkartni
		print("presentation diagram")
		local presentation_diagram = old_diagram_type:find("/presentation"):log()
		utilities.close_diagram(presentation_diagram)
		presentation_diagram:delete()
		old_diagram_type:find("/palette"):delete()
		c.delete_diagram_type(old_diagram_type)
	--end)
end

lQuery("GraphDiagramType"):attr({isNew = ""})

utilities.enqued_cmd("OkCmd")

