module(..., package.seeall)

require("lua_tda")
require "lpeg"
require "core"
specific = require "OWL_specific"

--dzes CompartType ar lietotaja definetu lauku un visu, kas ar to ir saistits
function deleteCompartType(compartType)
	local propRowSize = lQuery(compartType):find("/propertyRow/propertyTab/propertyRow"):size()
	if propRowSize <=1 then lQuery(compartType):find("/propertyRow/propertyTab"):delete() end
	
	lQuery(compartType):find("/propertyRow"):delete()
	lQuery(compartType):find("/propertyDiagram"):delete()
	lQuery(compartType):find("/choiceItem/elementStyleSetting"):delete()
	lQuery(compartType):find("/compartmentStyleSetting"):delete()
	lQuery(compartType):find("/choiceItem/compartmentStyleSetting"):delete()
	lQuery(compartType):find("/choiceItem/tag"):delete()
	lQuery(compartType):find("/choiceItem/notation"):delete()
	lQuery(compartType):find("/parentCompartType/translet[extensionPoint='OWLGrEd_GetAxiomAnnotation'][procedureName = 'OWLGrEd_UserFields.axiom.getAxiomAnnotation']"):delete()
	lQuery(compartType):find("/elemType/translet[extensionPoint='OWLGrEd_GetAxiomAnnotation'][procedureName = 'OWLGrEd_UserFields.axiom.getAxiomAnnotation']"):delete()
	local choiceItem = lQuery(compartType):find("/choiceItem")
	local compartment = lQuery(compartType):find("/compartment"):filter(
		function(obj)
			return lQuery(obj):attr("value") == lQuery(choiceItem):attr("value")
		end)
	lQuery(compartment):delete()
	lQuery(compartType):find("/choiceItem"):delete()
	lQuery(compartType):find("/tag"):delete()
	lQuery(compartType):find("/translet"):delete()
	lQuery(compartType):find("/compartStyle"):delete()
	lQuery(compartType):find("/compartment"):delete()
	
	--ja tiek dzest pedejais lietotaja definets comparType, kas zem ir AutoGeneratedGroup, tad ir jalikvide AutoGeneratedGroup limenis
	if compartType:find("/parentCompartType"):is_not_empty() and string.find(compartType:find("/parentCompartType"):attr("id"), "AutoGeneratedGroup")~=nil then
		local pr = compartType:find("/parentCompartType"):attr("adornmentPrefix")
		local suf = compartType:find("/parentCompartType"):attr("adornmentSuffix")
		--atrast vecako
		local parent = compartType:find("/parentCompartType/parentCompartType")
		if parent:is_empty() then 
			parent = compartType:find("/parentCompartType/elemType") 
			local autoGenGroup = compartType:find("/parentCompartType")
			if autoGenGroup:find("/subCompartType"):size() == 2 then 
				local tab = compartType:find("/parentCompartType/propertyRow/propertyTab")
				local dia = compartType:find("/parentCompartType/propertyRow/propertyDiagram")
				local subComparTypes = autoGenGroup:find("/subCompartType")
				subComparTypes:each(function(obj)
					if autoGenGroup:attr("id") ~= "AutoGeneratedGroupMultiplicity" then
						obj:find("/propertyRow"):remove_link("propertyTab", obj:find("/propertyRow/propertyTab"))
						obj:find("/propertyRow"):remove_link("propertyDiagram", obj:find("/propertyRow/propertyDiagram"))
					end
				end)
				subComparTypes:remove_link("parentCompartType", autoGenGroup)
				subComparTypes:link("compartStyle", autoGenGroup:find("/compartStyle"))
				local t = {}
				parent:find("/compartType"):each(function(obj)
					if obj:id() == autoGenGroup:id() then table.insert(t, subComparTypes) end
					table.insert(t, obj)
					obj:remove_link("elemType", parent)
				end)
				for i,v in pairs(t) do v:link("elemType", parent) end
				t = {}
				dia:find("/propertyRow"):each(function(obj)
					if obj:id() == autoGenGroup:find("/propertyRow"):id() then table.insert(t, subComparTypes:find("/propertyRow")) end
					table.insert(t, obj)
					obj:remove_link("propertyDiagram", dia)
				end)
				for i,v in pairs(t) do v:link("propertyDiagram", dia) end
				
				t = {}
				tab:find("/propertyRow"):each(function(obj)
					if obj:id() == autoGenGroup:find("/propertyRow"):id() then table.insert(t, subComparTypes:find("/propertyRow")) end
					table.insert(t, obj)
					obj:remove_link("propertyTab", tab)
				end)
				for i,v in pairs(t) do v:link("propertyTab", tab) end
			
				subComparTypes:attr("adornmentPrefix", pr)
				subComparTypes:attr("adornmentSuffix", suf)
				autoGenGroup:find("/propertyRow"):delete()
				autoGenGroup:find("/propertyDiagram"):delete()
				autoGenGroup:delete()
			end
		else
			local autoGenGroup = compartType:find("/parentCompartType")
			if autoGenGroup:find("/subCompartType"):size() == 2 then 
				local tab = compartType:find("/parentCompartType/propertyRow/propertyTab")
				local dia = compartType:find("/parentCompartType/propertyRow/propertyDiagram")
				local subComparTypes = autoGenGroup:find("/subCompartType")
				subComparTypes:each(function(obj)
					if autoGenGroup:attr("id") ~= "AutoGeneratedGroupMultiplicity" then
						obj:find("/propertyRow"):remove_link("propertyTab", obj:find("/propertyRow/propertyTab"))
						obj:find("/propertyRow"):remove_link("propertyDiagram", obj:find("/propertyRow/propertyDiagram"))
					end
				end)
				subComparTypes:remove_link("parentCompartType", autoGenGroup)
				subComparTypes:attr("adornmentPrefix", pr)
				subComparTypes:attr("adornmentSuffix", suf)
				
				local t = {}
				parent:find("/subCompartType"):each(function(obj)
					if obj:id() == autoGenGroup:id() then table.insert(t, subComparTypes) end
					table.insert(t, obj)
					obj:remove_link("parentCompartType", parent)
				end)
				for i,v in pairs(t) do v:link("parentCompartType", parent) end
				t = {}
				dia:find("/propertyRow"):each(function(obj)
					if obj:id() == autoGenGroup:find("/propertyRow"):id() then table.insert(t, subComparTypes:find("/propertyRow")) end
					table.insert(t, obj)
					obj:remove_link("propertyDiagram", dia)
				end)
				for i,v in pairs(t) do v:link("propertyDiagram", dia) end
				
				t = {}
				tab:find("/propertyRow"):each(function(obj)
					if obj:id() == autoGenGroup:find("/propertyRow"):id() then table.insert(t, subComparTypes:find("/propertyRow")) end
					table.insert(t, obj)
					obj:remove_link("propertyTab", tab)
				end)
				for i,v in pairs(t) do v:link("propertyTab", tab) end
					
				autoGenGroup:find("/propertyRow"):delete()
				autoGenGroup:find("/propertyDiagram"):delete()
				autoGenGroup:delete()
			end
		end
	end
	--ja tiek dzest pedejais lietotaja definets comparType, kas zem ir CheckBoxFictitious, tad ir jalikvide CheckBoxFictitious limenis
	if compartType:find("/parentCompartType"):is_not_empty() and string.find(compartType:find("/parentCompartType"):attr("id"), "CheckBoxFictitious")~=nil then
		local pr = compartType:find("/parentCompartType"):attr("adornmentPrefix")
		local suf = compartType:find("/parentCompartType"):attr("adornmentSuffix")
		--atrast vecako
		local parent = compartType:find("/parentCompartType/parentCompartType")
		if parent:is_empty() then 
			parent = compartType:find("/parentCompartType/elemType") 
			local checkBoxFic = compartType:find("/parentCompartType")
			if checkBoxFic:find("/subCompartType"):size() == 2 then 
				local subCheckBox = checkBoxFic:find("/subCompartType")
				subCheckBox:find("/propertyRow"):attr("rowType", "CheckBox")
				subCheckBox:find("/propertyDiagram"):delete()
				subCheckBox:remove_link("parentCompartType", checkBoxFic)
				subCheckBox:link("elemType", parent)
				checkBoxFic:delete()
				subCheckBox:attr("adornmentPrefix", pr)
				subCheckBox:attr("adornmentSuffix", suf)
			end
		else
			local checkBoxFic = compartType:find("/parentCompartType")
			if checkBoxFic:find("/subCompartType"):size() == 2 then 
				local subCheckBox = checkBoxFic:find("/subCompartType")
				subCheckBox:find("/propertyRow"):attr("rowType", "CheckBox")
				subCheckBox:find("/propertyDiagram"):delete()
				subCheckBox:remove_link("parentCompartType", checkBoxFic)
				checkBoxFic:delete()
				subCheckBox:link("parentCompartType", parent)
				subCheckBox:attr("adornmentPrefix", pr)
				subCheckBox:attr("adornmentSuffix", suf)
			end
		end
	end
	
	lQuery(compartType):find("/subCompartType"):each(function(obj)
		deleteCompartType(obj)
	end)
	
	lQuery(compartType):delete()
end