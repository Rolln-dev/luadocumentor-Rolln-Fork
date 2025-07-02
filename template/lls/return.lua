return[[
# local typeName = "NOTYPE"
# for _, type in pairs(_return.types) do
#   if type.typename and type.typeName ~= "" then
#       typeName = type.typename
#   elseif type.def and type.def.name ~= "" then
#       typeName = type.def.name
#   end
# end
---@return $(typeName) #$(_return.description:gsub("\n", " "))
]]