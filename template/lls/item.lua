return [[#
# --
# -- Resolve item type definition
# --
# local typedef = _item:resolvetype()
# local originallink = templateparams[1]
# local priv = ""
# local typeName = ""
# --
# -- Show item type class fields
# --
# if not typedef or typedef.tag ~= 'functiontypedef' then
#   if startsWithLower(_item.name) then
#       priv = "private "
#   end
#
#   if _item.type and _item.type.typename and _item.type.typename ~= "" then
#       typeName = _item.type.typename .. " "
#   elseif _item.type and _item.type.def and _item.type.def.name ~= "" then
#       typeName = _item.type.def.name .. " "
#   else
#       typeName = "NOTYPE "
#   end
---@field $(priv)$(_item.name) $(typeName)$(_item.shortdescription)
# end
# if typedef and typedef.tag == "functiontypedef" then
$(removeTrailingBlankLine(applytemplate(typedef, i+1, "lls")))
# end
#
]]
