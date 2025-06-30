return[[
# local typeName = ""
# for _, type in pairs(_return.types) do
#   if type.typename then
#       typeName = type.typename
#   elseif type.def then
#       typeName = type.def.name
#   end
# end
---@return $(typeName) #$(_return.description:gsub("\n", " "))
]]