
return[[
#
# if _file.image then

---<img src="https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Images/$(_file.image)" width="100%">
---
# end
#
# --
# -- Descriptions
# --
# if _file.shortdescription and _file.shortdescription ~= "" then
$( format(_file.shortdescription) )
# end
# if _file.description and _file.description ~= "" and #_file.description > 0 then
$( format(_file.description) )
# end
#
# -- get type corresponding to this file (module)
# local currenttype 
# local typeref = _file:moduletyperef()
# if typeref and typeref.tag == "internaltyperef" then
#  local typedef = _file.types[typeref.typename]
#  if typedef and typedef.tag == "recordtypedef" then
#    currenttype = typedef 
#  end
# end
#
# if _file.types then
#  for name, type in sortedpairs( _file.types ) do
#   if type ~= currenttype and type.tag == 'recordtypedef' and (not isempty(type.fields) or type:getcalldef()) then
#     if type ~= currenttype  and type.tag == 'recordtypedef' then
#       local gv = _file.globalvars[type.name]
$( applytemplate( type, i+1, "lls", _file.modules, gv ) )
#     end
#    end
#  end
# end
#
]]

