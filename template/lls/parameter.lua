return[[
# function isOptional(text)
#   return text:lower():find("%(optional%)") ~= nil
# end
# 
# local typeEntry = "NOTYPE"
#
# if _parameter.type and _parameter.type.typename ~= "" and not _parameter.type.def then
#   typeEntry = _parameter.type.typename
# elseif _parameter.type and _parameter.type.def and _parameter.type.def.name ~= "" then
#   typeEntry = _parameter.type.def.name
# end
#
# if isOptional(_parameter.description) then
---@param $(_parameter.name)? $(typeEntry) $(_parameter.description:gsub("\n", " "))
# else
---@param $(_parameter.name) $(typeEntry) $(_parameter.description:gsub("\n", " "))
# end
]]