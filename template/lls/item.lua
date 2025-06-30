return [[#
# --
# -- Resolve item type definition
# --
# local typedef = _item:resolvetype()
# local originallink = templateparams[1]
# --
# -- Show item type class fields
# --
# if not typedef or (typedef.tag ~= 'functiontypedef' and typedef.tag ~= "internaltyperef" and typedef.tag ~= "recordtypedef") then
---@field $(_item.name) $(_item.type.typename) $(_item.shortdescription)
# end
# if typedef and typedef.tag == "functiontypedef" then
$(removeTrailingBlankLine(applytemplate(typedef, i+1, "lls")))
# end
#
]]
