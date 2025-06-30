return[[
# if _parameter.type and _parameter.type.tag ~= "inlinetyperef" then
---@param $(_parameter.name) $(_parameter.type.typename) $(_parameter.description:gsub("\n", " "))
# elseif _parameter.type and _parameter.type.def then
---@param $(_parameter.name) $(_parameter.type.def.name) $(_parameter.description:gsub("\n", " "))
# else
---@param $(_parameter.name) NOTYPE $(_parameter.description:gsub("\n", " "))
# end
]]